/*
 *  PGRMathHelpers.m
 *  ===============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of mathematical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRMathHelpers.h"


@implementation PGRMathHMS


+ (PGRMathHMS *)objectWithDegrees:(double)degrees {
    return [[PGRMathHMS alloc] initWithDegrees:degrees];
}


- (instancetype)initWithDegrees:(double)degrees {
    if ( (self = [super init]) ) {
        static const int secs_in_a_day = 86400;
        static const int secs_in_an_hour = 3600;
        const double norm_degs = PGRMathNormalizeDegrees(degrees);
        const int total_seconds = (int) floor((norm_degs / 360) * secs_in_a_day);
        
        _hours = total_seconds / secs_in_an_hour;
        _minutes = (total_seconds - _hours * secs_in_an_hour) / 60;
        _seconds = total_seconds - _hours * secs_in_an_hour - _minutes * 60;
   }
    return self;
}


@end


@implementation PGRMathDMS


+ (PGRMathDMS *)objectWithDegrees:(double)degrees {
    return [[PGRMathDMS alloc] initWithDegrees:degrees];
}


- (instancetype)initWithDegrees:(double)degrees {
    if ( (self = [super init]) ) {
        static const int secs_in_an_hour = 3600;
        const int total_seconds = (int) (degrees > 0 ? floor(degrees * secs_in_an_hour) :
                                         ceil(degrees * secs_in_an_hour));
        
        _degrees = total_seconds / secs_in_an_hour;
        _minutes = (total_seconds - _degrees * secs_in_an_hour) / 60;
        _seconds = total_seconds - _degrees * secs_in_an_hour - _minutes * 60;
    }
    return self;
}


@end


@implementation PGRMathSphCoords

@end


@implementation PGRMath3DCartCoords


+ (PGRMath3DCartCoords *)objectWithX:(double)x Y:(double)y Z:(double)z {
    return [[PGRMath3DCartCoords alloc] initWithX:x Y:y Z:z];
}


- (instancetype)initWithX:(double)x Y:(double)y Z:(double)z {
    if ( (self = [super init]) ) {
        self.x = x;
        self.y = y;
        self.z = z;
    }
    
    return self;
}


- (PGRMathSphCoords *)toSpherical {
    PGRMathSphCoords * scd = [PGRMathSphCoords new];
    
    scd.azimuth = PGRMathRadiansToDegrees(atan2(self.y, self.x));
    scd.inclination = PGRMathRadiansToDegrees(atan(self.z / hypot(self.x, self.y)));
    scd.radius = sqrt(pow(self.x, 2) + pow(self.y, 2) + pow(self.z, 2));
    
    return scd;
}


@end


//  C function definitions


double PGRMathNormalizeDegrees(const double angle) {
    return angle - 360 * floor(angle / 360);
}


double PGRMathRadiansToDegrees(const double radians) {
    return radians / (M_PI / 180);
}


double PGRMathDegreesToRadians(const double degrees) {
    return degrees * (M_PI / 180);
}


NSString * PGRMathMakeRoman(const int num) {
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
