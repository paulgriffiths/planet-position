//
//  PGAstroGeneral.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGAstroGeneral.h"


@implementation PGAstroHMS

@end


@implementation PGAstroDMS

@end


@implementation PGAstroZodiacInfo

@end


@implementation PGAstroSphCoords

@end


@implementation PGAstroRectCoords


/*
 *  Converts rectangular coordinates to spherical coordinates.
 */

- (PGAstroSphCoords *)toSpherical {
    PGAstroSphCoords * scd = [PGAstroSphCoords new];
    scd.rightAscension = degrees(atan2(self.y, self.x));
    scd.declination = degrees(atan(self.z / hypot(self.x, self.y)));
    scd.distance = sqrt(pow(self.x, 2) + pow(self.y, 2) + pow(self.z, 2));
    
    return scd;
}

@end


@implementation PGAstroOrbElem

@end


/*
 *  Returns a double representing an angle in degrees in the
 *  range 0 <= d < 360, when the supplied angle may or may
 *  not be outside of this range.
 */

double normalize_degrees(const double angle) {
    return angle - 360 * floor(angle / 360);
}


/*
 *  Converts radians to degrees.
 */

double degrees(const double rads) {
    return rads / (M_PI / 180);
}


/*
 *  Converts degrees to radians.
 */

double radians(const double degs) {
    return degs * (M_PI / 180);
}


/*
 *  Converts a degree angle to hours, minutes and seconds
*/

PGAstroHMS * deg_to_hms(const double degrees) {
    static const double secs_in_a_day = 86400;
    static const double secs_in_an_hour = 3600;
    const double norm_degs = normalize_degrees(degrees);
    const int total_seconds = floor((norm_degs / 360) * secs_in_a_day);
    
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


/*
 *  Converts a degree angle to degrees, minutes and seconds
 */

PGAstroDMS * deg_to_dms(const double degrees) {
    static const double secs_in_an_hour = 3600;
    const int total_seconds = degrees > 0 ? floor(degrees * secs_in_an_hour) :
    ceil(degrees * secs_in_an_hour);
    
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


/*
 *  Calculates the length of the hypotenuse using Pythagoras.
 */
/*
double hypot(const double opp, const double adj) {
    return sqrt(pow(opp, 2) + pow(adj, 2));
}
*/

/*
 *  Calculates information pertaining to the zodiacal position
 *  of the supplied right ascension.
 */

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


/*
 *  Calculates the Julian Date for the provided NSDate.
 */

double julian_day(const NSDate * dateObject) {
    static const double epoch_j2000 = 2451545;
    static const double secs_in_a_day = 86400;
    static NSDate * epochDate;
    
    if ( !epochDate ) {
        NSDateComponents * epochComponents = [NSDateComponents new];
        [epochComponents setYear:2000];
        [epochComponents setMonth:1];
        [epochComponents setDay:1];
        [epochComponents setHour:12];
        [epochComponents setMinute:0];
        [epochComponents setSecond:0];
        [epochComponents setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        
        NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        epochDate = [gregorian dateFromComponents:epochComponents];
    }
    
    NSTimeInterval secondsSinceEpoch = [dateObject timeIntervalSinceDate:epochDate];
    
    const double days_since_j2000 = secondsSinceEpoch / secs_in_a_day;
    return epoch_j2000 + days_since_j2000;
}


/*
 *  Solves Kepler's equation.
 *
 *  Arguments:
 *    m_anom - mean anomaly, in radians
 *    ecc - eccentricity
 *
 *  Returns:
 *    the eccentric anomaly, in radians.
 */

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


/*
 *  Returns a pointer to a C string representation of the
 *  of the name of the zodiac sign which contains the supplied
 *  right ascension.
 */

NSString * zodiac_sign(const double rasc) {
    PGAstroZodiacInfo * zInfo = get_zodiac_info(rasc);
    return zInfo.signName;
}


/*
 *  Returns a pointer to a C string representation of the
 *  of the short name of the zodiac sign which contains the supplied
 *  right ascension.
 */

NSString * zodiac_sign_short(const double rasc) {
    PGAstroZodiacInfo * zInfo = get_zodiac_info(rasc);
    return zInfo.signShortName;
}


/*
 *  Returns a zodiacal coordinate of the form 20GE19 for
 *  the supplied right ascension.
 */

NSString * rasc_to_zodiac(const double rasc) {
    PGAstroZodiacInfo * zInfo = get_zodiac_info(rasc);
    return [NSString stringWithFormat:@"%02i%@%02i", zInfo.zodiacDMS.degrees, zInfo.signShortName, zInfo.zodiacDMS.minutes];
}


/*
 *  Returns a string representation in the form "12h 10m 30s" of
 *  the hours-minutes-seconds representation of the supplied right
 *  ascension.
 */

NSString * rasc_string(const double rasc) {
    PGAstroHMS * hms = deg_to_hms(rasc);
    return [NSString stringWithFormat:@"%02ih %02im %02is", hms.hours, hms.minutes, hms.seconds];
}


/*
 *  Returns a string representation in the form "+12d 10m 30s" of
 *  the degrees-minutes-seconds representation of the supplied
 *  declination.
 */

NSString * decl_string(const double decl) {
    PGAstroDMS * dms = deg_to_dms(decl);
    return [NSString stringWithFormat:@"%@%02id %02im %02is",
            (dms.degrees >= 0 ? @"+" : @""), dms.degrees, dms.minutes, dms.seconds];
}


@implementation PGAstroGeneral

@end
