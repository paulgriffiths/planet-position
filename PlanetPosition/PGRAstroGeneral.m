/*
 *  PGRAstroGeneral.m
 *  =================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of astronomical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRAstroGeneral.h"
#import "PGRAstroPlanets.h"
#import "PGRDateHelpers.h"


/**
 File-scope array of names of the signs of the zodiac.
 */
static const char * const zodiac_signs[] = {
    "Aries", "Taurus", "Gemini", "Cancer",
    "Leo", "Virgo", "Libra", "Scorpio",
    "Sagittarius", "Capricorn", "Aquarius", "Pisces"
};


/**
 File-scope array of short-form names of the signs of the zodiac.
 */
static const char * const zodiac_signs_short[] = {
    "AR", "TA", "GE", "CN", "LE", "VI",
    "LI", "SC", "SG", "CP", "AQ", "PI"
};


@implementation PGRAstroZodiacInfo


+ (PGRAstroZodiacInfo *)objectWithRasc:(double)rasc {
    return [[PGRAstroZodiacInfo alloc] initWithRasc:rasc];
}


- (instancetype)initWithRasc:(double)rasc {
    if ( (self = [super init]) ) {
        _rightAscension = PGRMathNormalizeDegrees(rasc);
        
        _zodiacDMS = [PGRMathDMS objectWithDegrees:_rightAscension];
        _signIndex = _zodiacDMS.degrees / 30;
        _zodiacDMS.degrees %= 30;
        
        _signName = [NSString stringWithFormat:@"%s", zodiac_signs[self.signIndex]];
        _signShortName = [NSString stringWithFormat:@"%s", zodiac_signs_short[self.signIndex]];
        
        if ( _zodiacDMS.degrees < 10 ) {
            _zodiacDecan = @"Ascendant";
        } else if ( _zodiacDMS.degrees < 20 ) {
            _zodiacDecan = @"Succedent";
        } else {
            _zodiacDecan = @"Cadent";
        }
    }
    
    return self;
}


@end


@implementation PGRAstroOrbElem


+ (PGRAstroOrbElem *)objectWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan {
    return [[PGRAstroOrbElem alloc] initWithSma:sma Ecc:ecc Inc:inc Ml:ml Lp:lp Lan:lan];
}


- (instancetype)initWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan {
    if ( (self = [super init]) ) {
        _sma = sma;
        _ecc = ecc;
        _inc = inc;
        _ml = ml;
        _lp = lp;
        _lan = lan;
        _man = _ml - _lp;
        _arp = _lp - _lan;
    }
    
    return self;
}


+ (instancetype)objectWithEpochElements:(PGRAstroOrbElem *)epochOEs periodElements:(PGRAstroOrbElem *)periodOEs
                         numberPeriods:(double)numPeriods convertToRadians:(BOOL)radConvert {
    if ( radConvert ) {
        return [PGRAstroOrbElem objectWithSma:epochOEs.sma + periodOEs.sma * numPeriods
                                          Ecc:epochOEs.ecc + periodOEs.ecc * numPeriods
                                          Inc:PGRMathDegreesToRadians(epochOEs.inc + periodOEs.inc * numPeriods)
                                           Ml:PGRMathDegreesToRadians(epochOEs.ml + periodOEs.ml * numPeriods)
                                           Lp:PGRMathDegreesToRadians(epochOEs.lp + periodOEs.lp * numPeriods)
                                          Lan:PGRMathDegreesToRadians(epochOEs.lan + periodOEs.lan * numPeriods)];
    } else {
        return [PGRAstroOrbElem objectWithSma:epochOEs.sma + periodOEs.sma * numPeriods
                                          Ecc:epochOEs.ecc + periodOEs.ecc * numPeriods
                                          Inc:epochOEs.inc + periodOEs.inc * numPeriods
                                           Ml:epochOEs.ml + periodOEs.ml * numPeriods
                                           Lp:epochOEs.lp + periodOEs.lp * numPeriods
                                          Lan:epochOEs.lan + periodOEs.lan * numPeriods];
    }
}


@end


//  C function definitions


double PGRAstroJulianDay(const NSDate * dateObject) {
    static const double epoch_j2000 = 2451545;
    static const double secs_in_a_day = 86400;
    static NSDate * epochDate;
    
    if ( !epochDate ) {
        epochDate = PGRDateGetUTCDate(2000, 1, 1, 12, 0, 0);
    }
    
    const NSTimeInterval secondsSinceEpoch = [dateObject timeIntervalSinceDate:epochDate];
    
    const double days_since_j2000 = secondsSinceEpoch / secs_in_a_day;
    return epoch_j2000 + days_since_j2000;
}


double PGRAstroKepler(const double m_anom, const double ecc) {
    const double desired_accuracy = 1e-6;
    
    assert(ecc >= 0);       // Eccentricity is 0 for a circle
    assert(ecc < 1);        // Eccentricity is less than 1 for an ellipse
    
    double e_anom = m_anom;
    double diff;
    
    do {
        diff = e_anom - ecc * sin(e_anom) - m_anom;
        e_anom -= diff / (1 - ecc * cos(e_anom));
    } while ( fabs(diff) > desired_accuracy );
    
    return e_anom;
}


NSString * PGRAstroZodiacSign(const double rasc) {
    PGRAstroZodiacInfo * zInfo = [PGRAstroZodiacInfo objectWithRasc:rasc];
    return zInfo.signName;
}


NSString * PGRAstroZodiacSignShort(const double rasc) {
    PGRAstroZodiacInfo * zInfo = [PGRAstroZodiacInfo objectWithRasc:rasc];
    return zInfo.signShortName;
}


NSString * PGRAstroRascToZodiac(const double rasc) {
    PGRAstroZodiacInfo * zInfo = [PGRAstroZodiacInfo objectWithRasc:rasc];
    return [NSString stringWithFormat:@"%02i%@%02i", zInfo.zodiacDMS.degrees, zInfo.signShortName, zInfo.zodiacDMS.minutes];
}


NSString * PGRAstroRascString(const double rasc) {
    PGRMathHMS * hms = [PGRMathHMS objectWithDegrees:rasc];
    return [NSString stringWithFormat:@"%02ih %02im %02is", hms.hours, hms.minutes, hms.seconds];
}


NSString * PGRAstroDeclString(const double decl) {
    PGRMathDMS * dms = [PGRMathDMS objectWithDegrees:decl];
    return [NSString stringWithFormat:@"%@%02i%@ %02im %02is",
            (dms.degrees >= 0 ? @"+" : @"-"), abs(dms.degrees), @"\u00B0", abs(dms.minutes), abs(dms.seconds)];
}


NSString * PGRAstroGetThelemicYear(NSDate * date) {
    NSDateComponents * components = PGRDateGetUTCComponentsFromDate(date);
    long year = [components year] - 1904;
    
    double rasc = PGRMathNormalizeDegrees([[PGRAstroSun planetWithDate:date] rightAscension]);
    if ( rasc > 270 && [components month] <= 3 ) {
        year -= 1;
    }
    
    if ( year < 0 ) {
        return @"Before New Era";
    }
    
    long cycle = (year / 22);
    long cycle_year = year - (cycle * 22);
    
    NSString * cycleString;
    if ( cycle == 0 ) {
        cycleString = @"";
    } else {
        cycleString = [NSString stringWithFormat:@"%@:", PGRMathMakeRoman((int) cycle)];
    }
    
    return [NSString stringWithFormat:@"%@%li", cycleString, cycle_year];
}
