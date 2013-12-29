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


//  Static file-scope data

static const char * const zodiac_signs[] = {
    "Aries", "Taurus", "Gemini", "Cancer",
    "Leo", "Virgo", "Libra", "Scorpio",
    "Sagittarius", "Capricorn", "Aquarius", "Pisces"
};
static const char * const zodiac_signs_short[] = {
    "AR", "TA", "GE", "CN", "LE", "VI",
    "LI", "SC", "SG", "CP", "AQ", "PI"
};


//  Class to store information about the zodiacal position of a right ascension measurement

@implementation PGAstroZodiacInfo


//  Class method to create object based on provided right ascension

+ (PGAstroZodiacInfo *)objectWithRasc:(double)rasc {
    return [[PGAstroZodiacInfo alloc] initWithRasc:rasc];
}


//  Initializer method to initialize object based on provided right ascension

- (instancetype)initWithRasc:(double)rasc {
    if ( (self = [super init]) ) {
        self.rightAscension = PGRMathNormalizeDegrees(rasc);
        
        self.zodiacDMS = [PGRMathDMS objectWithDegrees:self.rightAscension];
        self.signIndex = self.zodiacDMS.degrees / 30;
        self.zodiacDMS.degrees %= 30;
        
        self.signName = [NSString stringWithFormat:@"%s", zodiac_signs[self.signIndex]];
        self.signShortName = [NSString stringWithFormat:@"%s", zodiac_signs_short[self.signIndex]];
        
        if ( self.zodiacDMS.degrees < 10 ) {
            self.zodiacDecan = @"Ascendant";
        } else if ( self.zodiacDMS.degrees < 20 ) {
            self.zodiacDecan = @"Succedent";
        } else {
            self.zodiacDecan = @"Cadent";
        }
    }
    
    return self;
}


@end


//  Class to store a set of Keplerian elements

@implementation PGAstroOrbElem


//  Public convenience class method to instantiate an object with a date

+(PGAstroOrbElem *)objectWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan {
    return [[PGAstroOrbElem alloc] initWithSma:sma Ecc:ecc Inc:inc Ml:ml Lp:lp Lan:lan];
}


//  Initializer method

-(instancetype)initWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan {
    if ( (self = [super init]) ) {
        self.sma = sma;
        self.ecc = ecc;
        self.inc = inc;
        self.ml = ml;
        self.lp = lp;
        self.lan = lan;
        self.man = self.ml - self.lp;
        self.arp = self.lp - self.lan;
    }
    
    return self;
}


@end


//  Calculates the Julian Day for the provided NSDate.

double julian_day(const NSDate * dateObject) {
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


//  Solves Kepler's equation for the provided mean anomaly and eccentricity, in radians

double kepler(const double m_anom, const double ecc) {
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


//  Returns an NSString representation of the name of the zodiac
//  sign which contains the right ascension supplied in degrees.

NSString * zodiac_sign(const double rasc) {
    PGAstroZodiacInfo * zInfo = [PGAstroZodiacInfo objectWithRasc:rasc];
    return zInfo.signName;
}


//  Returns an NSString representation of the short name of the zodiac
//  sign which contains the right ascension supplied in degrees,
//  e.g. "GE" for Gemini.

NSString * zodiac_sign_short(const double rasc) {
    PGAstroZodiacInfo * zInfo = [PGAstroZodiacInfo objectWithRasc:rasc];
    return zInfo.signShortName;
}


//  Returns an NSString containing a representation of the zodiacal coordinate
//  of the form 20GE19 for the right ascension supplied in degrees, where 20GE19
//  is 20 degrees and 19 minutes into the sign of Gemini.

NSString * rasc_to_zodiac(const double rasc) {
    PGAstroZodiacInfo * zInfo = [PGAstroZodiacInfo objectWithRasc:rasc];
    return [NSString stringWithFormat:@"%02i%@%02i", zInfo.zodiacDMS.degrees, zInfo.signShortName, zInfo.zodiacDMS.minutes];
}


//  Returns a string representation in the form "12h 10m 30s" of
//  the hours-minutes-seconds representation of the right
//  ascension supplied in degrees.

NSString * rasc_string(const double rasc) {
    PGRMathHMS * hms = [PGRMathHMS objectWithDegrees:rasc];
    return [NSString stringWithFormat:@"%02ih %02im %02is", hms.hours, hms.minutes, hms.seconds];
}


//  Returns a string representation in the form "+12d 10m 30s" of
//  the degrees-minutes-seconds representation of the declination
//  supplied in degrees. Uses a degree sign instead of 'd'.

NSString * decl_string(const double decl) {
    PGRMathDMS * dms = [PGRMathDMS objectWithDegrees:decl];
    return [NSString stringWithFormat:@"%@%02i%@ %02im %02is",
            (dms.degrees >= 0 ? @"+" : @"-"), abs(dms.degrees), @"\u00B0", abs(dms.minutes), abs(dms.seconds)];
}


//  Returns a string representation of the Thelemic year corresponding to a given NSDate.
//  Thelemic years are represented in the form XX:YY, where XX is a Roman numeral equal to
//  the number of full 22 solar year cycles between the spring equinox of 1904 and the current
//  date (this is left blank if zero) and YY is the number of full solar years since the
//  beginning of the current 22 year cycle. For instance, a date in May 1904 would have the
//  Thelemic year "0", a date in August 1925 would have the Thelemic year "21", and a date in
//  April 1926 would have the Thelemic year "I:0".

NSString * get_thelemic_year(NSDate * date) {
    NSDateComponents * components = PGRDateGetUTCComponentsFromDate(date);
    long year = [components year] - 1904;
    
    double rasc = PGRMathNormalizeDegrees([[PGAstroSun planetWithDate:date] rightAscension]);
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