/*
 *  PGMathHelpers.m
 *  ===============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of mathematical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGMathHelpers.h"


//  Class to store an hours, minutes and seconds representation

@implementation PGMathHMS

@end


//  Class to store a degrees, minutes and seconds representation

@implementation PGMathDMS

@end


//  Class to store spherical coordinates

@implementation PGMathSphCoords

@end


//  Class to store three-dimensional rectangular coordinates

@implementation PGMathRectCoords


//  Public class convenience method for creating new object

+(PGMathRectCoords *)objectWithX:(double)x Y:(double)y Z:(double)z {
    return [[PGMathRectCoords alloc] initWithX:x Y:y Z:x];
}


//  Initializer method

- (PGMathRectCoords *)initWithX:(double)x Y:(double)y Z:(double)z {
    if ( (self = [super init]) ) {
        self.x = x;
        self.y = y;
        self.z = z;
    }
    
    return self;
}


//  Method to convert to spherical coordinates.

- (PGMathSphCoords *)toSpherical {
    PGMathSphCoords * scd = [PGMathSphCoords new];
    
    scd.rightAscension = radToDeg(atan2(self.y, self.x));
    scd.declination = radToDeg(atan(self.z / hypot(self.x, self.y)));
    scd.distance = sqrt(pow(self.x, 2) + pow(self.y, 2) + pow(self.z, 2));
    
    return scd;
}


//  Returns a double representing an angle in degrees in the
//  range 0 <= d < 360, when the supplied angle may or may
//  not be outside of this range.

double normalizeDegrees(const double angle) {
    return angle - 360 * floor(angle / 360);
}


//  Converts radians to degrees.

double radToDeg(const double radians) {
    return radians / (M_PI / 180);
}


//  Converts degrees to radians.

double degToRad(const double degrees) {
    return degrees * (M_PI / 180);
}


//  Converts the supplied degree angle to hours, minutes and seconds

PGMathHMS * degToHms(const double degrees) {
    static const double secs_in_a_day = 86400;
    static const double secs_in_an_hour = 3600;
    const double norm_degs = normalizeDegrees(degrees);
    const int total_seconds = (int) floor((norm_degs / 360) * secs_in_a_day);
    
    PGMathHMS * hmsOut = [PGMathHMS new];
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

PGMathDMS * degToDms(const double degrees) {
    static const double secs_in_an_hour = 3600;
    const int total_seconds = (int) (degrees > 0 ? floor(degrees * secs_in_an_hour) :
                                     ceil(degrees * secs_in_an_hour));
    
    PGMathDMS * dmsOut = [PGMathDMS new];
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


//  Converts a number between 0 and 4,999 inclusive to Roman numerals

NSString * makeRoman(const int num) {
    static const char * ones_roman[] = {"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"};
    static const char * tens_roman[] = {"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"};
    static const char * cents_roman[] = {"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"};
    static const char * thous_roman[] = {"", "M", "MM", "MMM", "MMMM"};
    
    if ( num < 0 || num > 4999 ) {
        return nil;
    } else if ( num == 0 ) {
        return @"0";
    }
    
    const int ones = num % 10;
    const int tens = ((num % 100) - ones) / 10;
    const int cents = ((num % 1000) - tens - ones) / 100;
    const int thous = (num - cents - tens - ones) / 1000;
    
    return [NSString stringWithFormat:@"%s%s%s%s", thous_roman[thous], cents_roman[cents], tens_roman[tens], ones_roman[ones]];
}


@end


