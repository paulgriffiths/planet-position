/*
 *  PGAstroGeneral.m
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of astronomical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGAstroGeneral.h"


//  Class to store an hours, minutes and seconds representation

@implementation PGAstroHMS

@end


//  Class to store a degrees, minutes and seconds representation

@implementation PGAstroDMS

@end


//  Class to store information about the zodiacal position of a right ascension measurement

@implementation PGAstroZodiacInfo

@end


//  Class to store spherical coordinates

@implementation PGAstroSphCoords

@end


//  Class to store three-dimensional rectangular coordinates

@implementation PGAstroRectCoords


//  Initializer method

- (PGAstroRectCoords *)initWithX:(double)x Y:(double)y Z:(double)z {
    if ( (self = [super init]) ) {
        self.x = x;
        self.y = y;
        self.z = z;
    }
    
    return self;
}


//  Method to convert to spherical coordinates.

- (PGAstroSphCoords *)toSpherical {
    PGAstroSphCoords * scd = [PGAstroSphCoords new];
    
    scd.rightAscension = degrees(atan2(self.y, self.x));
    scd.declination = degrees(atan(self.z / hypot(self.x, self.y)));
    scd.distance = sqrt(pow(self.x, 2) + pow(self.y, 2) + pow(self.z, 2));
    
    return scd;
}


@end


//  Class to store a set of Keplerian elements

@implementation PGAstroOrbElem


//  Initializer method

-(PGAstroOrbElem *)initWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan {
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


//  Returns a double representing an angle in degrees in the
//  range 0 <= d < 360, when the supplied angle may or may
//  not be outside of this range.

double normalize_degrees(const double angle) {
    return angle - 360 * floor(angle / 360);
}


//  Converts radians to degrees.

double degrees(const double rads) {
    return rads / (M_PI / 180);
}


//  Converts degrees to radians.

double radians(const double degs) {
    return degs * (M_PI / 180);
}


//  Convenience function to return an NSDate for the specified UTC time
//  under the Gregorian Calendar.

NSDate * get_utc_date(int year, int month, int day, int hour, int minute, int second) {
    NSDateComponents * epochComponents = [NSDateComponents new];
    [epochComponents setYear:year];
    [epochComponents setMonth:month];
    [epochComponents setDay:day];
    [epochComponents setHour:hour];
    [epochComponents setMinute:minute];
    [epochComponents setSecond:second];
    [epochComponents setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorian dateFromComponents:epochComponents];
}


//  Converts the supplied degree angle to hours, minutes and seconds

PGAstroHMS * deg_to_hms(const double degrees) {
    static const double secs_in_a_day = 86400;
    static const double secs_in_an_hour = 3600;
    const double norm_degs = normalize_degrees(degrees);
    const int total_seconds = (int) floor((norm_degs / 360) * secs_in_a_day);
    
    PGAstroHMS * hmsOut = [PGAstroHMS new];
    hmsOut.hours = total_seconds / secs_in_an_hour;
    hmsOut.minutes = (total_seconds - hmsOut.hours * secs_in_an_hour) / 60;
    hmsOut.seconds = total_seconds - hmsOut.hours * secs_in_an_hour - hmsOut.minutes * 60;
    
    assert(hmsOut.hours >= 0);
    assert(hmsOut.hours < 24);
    assert(hmsOut.minutes >= 0);
    assert(hmsOut.minutes < 60);
    assert(hmsOut.seconds >= 0);
    assert(hmsOut.seconds < 60);
    
    return hmsOut;
}


//  Converts the supplied degree angle to degrees, minutes and seconds

PGAstroDMS * deg_to_dms(const double degrees) {
    static const double secs_in_an_hour = 3600;
    const int total_seconds = (int) (degrees > 0 ? floor(degrees * secs_in_an_hour) :
    ceil(degrees * secs_in_an_hour));
    
    PGAstroDMS * dmsOut = [PGAstroDMS new];
    dmsOut.degrees = total_seconds / secs_in_an_hour;
    dmsOut.minutes = (total_seconds - dmsOut.degrees * secs_in_an_hour) / 60;
    dmsOut.seconds = total_seconds - dmsOut.degrees * secs_in_an_hour -
    dmsOut.minutes * 60;
    
    assert(dmsOut.minutes > -60);
    assert(dmsOut.minutes < 60);
    assert(dmsOut.seconds > -60);
    assert(dmsOut.seconds < 60);
    
    return dmsOut;
}


//  Calculates information pertaining to the zodiacal position
//  of the supplied right ascension in degrees.

PGAstroZodiacInfo * get_zodiac_info(const double rasc) {
    static const char * const zodiac_signs[] = {
        "Aries", "Taurus", "Gemini", "Cancer",
        "Leo", "Virgo", "Libra", "Scorpio",
        "Sagittarius", "Capricorn", "Aquarius", "Pisces"
    };
    static const char * const zodiac_signs_short[] = {
        "AR", "TA", "GE", "CN", "LE", "VI",
        "LI", "SC", "SG", "CP", "AQ", "PI"
    };
    
    const double norm_degs = normalize_degrees(rasc);
    
    PGAstroZodiacInfo * zInfo = [PGAstroZodiacInfo new];
    zInfo.zodiacDMS = deg_to_dms(norm_degs);
    zInfo.rightAscension = norm_degs;
    zInfo.signIndex = zInfo.zodiacDMS.degrees / 30;
    zInfo.zodiacDMS.degrees %= 30;
    
    assert(zInfo.signIndex >= 0);
    assert(zInfo.signIndex < 12);
    
    zInfo.signName = [NSString stringWithFormat:@"%s", zodiac_signs[zInfo.signIndex]];
    zInfo.signShortName = [NSString stringWithFormat:@"%s", zodiac_signs_short[zInfo.signIndex]];
    
    assert(zInfo.zodiacDMS.degrees >= 0);
    assert(zInfo.zodiacDMS.degrees < 30);
    
    return zInfo;
}


//  Calculates the Julian Day for the provided NSDate.

double julian_day(const NSDate * dateObject) {
    static const double epoch_j2000 = 2451545;
    static const double secs_in_a_day = 86400;
    static NSDate * epochDate;
    
    if ( !epochDate ) {
        epochDate = get_utc_date(2000, 1, 1, 12, 0, 0);
    }
    
    NSTimeInterval secondsSinceEpoch = [dateObject timeIntervalSinceDate:epochDate];
    
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
    PGAstroZodiacInfo * zInfo = get_zodiac_info(rasc);
    return zInfo.signName;
}


//  Returns an NSString representation of the short name of the zodiac
//  sign which contains the right ascension supplied in degrees,
//  e.g. "GE" for Gemini.

NSString * zodiac_sign_short(const double rasc) {
    PGAstroZodiacInfo * zInfo = get_zodiac_info(rasc);
    return zInfo.signShortName;
}


//  Returns an NSString containing a representation of the zodiacal coordinate
//  of the form 20GE19 for the right ascension supplied in degrees, where 20GE19
//  is 20 degrees and 19 minutes into the sign of Gemini.

NSString * rasc_to_zodiac(const double rasc) {
    PGAstroZodiacInfo * zInfo = get_zodiac_info(rasc);
    return [NSString stringWithFormat:@"%02i%@%02i", zInfo.zodiacDMS.degrees, zInfo.signShortName, zInfo.zodiacDMS.minutes];
}


//  Returns a string representation in the form "12h 10m 30s" of
//  the hours-minutes-seconds representation of the right
//  ascension supplied in degrees.

NSString * rasc_string(const double rasc) {
    PGAstroHMS * hms = deg_to_hms(rasc);
    return [NSString stringWithFormat:@"%02ih %02im %02is", hms.hours, hms.minutes, hms.seconds];
}


//  Returns a string representation in the form "+12d 10m 30s" of
//  the degrees-minutes-seconds representation of the declination
//  supplied in degrees.

NSString * decl_string(const double decl) {
    PGAstroDMS * dms = deg_to_dms(decl);
    return [NSString stringWithFormat:@"%@%02id %02im %02is",
            (dms.degrees >= 0 ? @"+" : @""), dms.degrees, abs(dms.minutes), abs(dms.seconds)];
}
