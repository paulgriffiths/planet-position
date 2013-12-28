/*
 *  PGMathHelpers.h
 *  ===============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to mathematical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>


//  Class to store an hours, minutes and seconds representation

@interface PGMathHMS : NSObject

@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

+(PGMathHMS *)objectWithDegrees:(double)degrees;
-(PGMathHMS *)initWithDegrees:(double)degrees;


@end


//  Class to store a degrees, minutes and seconds representation

@interface PGMathDMS : NSObject

@property (nonatomic) int degrees;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

+(PGMathDMS *)objectWithDegrees:(double)degrees;
-(PGMathDMS *)initWithDegrees:(double)degrees;


@end


//  Class to store spherical coordinates

@interface PGMathSphCoords : NSObject

@property (nonatomic) double rightAscension;
@property (nonatomic) double declination;
@property (nonatomic) double distance;

@end


//  Class to store three-dimensional rectangular coordinates

@interface PGMathRectCoords : NSObject

@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;

+(PGMathRectCoords *)objectWithX:(double)x Y:(double)y Z:(double)z;

-(PGMathRectCoords *)initWithX:(double)x Y:(double)y Z:(double)z;
-(PGMathSphCoords *)toSpherical;

@end


//  C helper function prototypes

double normalizeDegrees(const double angle);
double radToDeg(const double rads);
double degToRad(const double degs);
NSString * makeRoman(const int num);

