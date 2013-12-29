/*
 *  PGRMathHelpers.h
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to mathematical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>


/**
  A class to store the hours, minutes, and second components of an angle.
 */
@interface PGRMathHMS : NSObject

/**
  The hours component of the angle, with 24 hours in 360 degrees.
 */
@property (nonatomic, readwrite) int hours;

/**
  The minutes component of the angle, with 60 minutes in an hour.
 */
@property (nonatomic, readwrite) int minutes;

/**
  The seconds component of the angle, with 60 seconds in a minute.
 */
@property (nonatomic, readwrite) int seconds;

/**
 Returns an object created from a specified angle in degrees.
 @param degrees The angle in degrees.
 @return An object created from a specified angle in degrees.
 */
+(PGRMathHMS *)objectWithDegrees:(double)degrees;

/**
  Returns an object initialized from a specified angle in degrees.
  @param degrees The angle in degrees.
  @return An object initialized from a specified angle in degrees.
 */
-(instancetype)initWithDegrees:(double)degrees;


@end


/**
 A class to store the hours, minutes, and second components of an angle.
 */
@interface PGRMathDMS : NSObject

/**
 The degrees component of the angle.
 */
@property (nonatomic, readwrite) int degrees;

/**
 The minutes component of the angle, with 60 minutes in an degree.
 */
@property (nonatomic, readwrite) int minutes;

/**
 The seconds component of the angle, with 60 seconds in a minute.
 */
@property (nonatomic, readwrite) int seconds;

/**
 Returns an object created from a specified angle in degrees.
 @param degrees The angle in degrees.
 @return An object created from the specified angle in degrees.
 */
+(PGRMathDMS *)objectWithDegrees:(double)degrees;

/**
 Returns an object initialized with a specified angle in degrees.
 @param degrees The angle in degrees.
 @return An object initialized with the specified angle in degrees.
 */
-(instancetype)initWithDegrees:(double)degrees;


@end


/**
  A class to store spherical coordinates.
 */
@interface PGRMathSphCoords : NSObject

/**
 The right ascension, or azimuth coordinate.
 */
@property (nonatomic, readwrite) double azimuth;

/**
 The declination, or inclination coordinate.
 */
@property (nonatomic, readwrite) double inclination;

/**
 The distance, or radius coordinate
 */
@property (nonatomic, readwrite) double radius;


@end


/**
 A class to store three-dimensional Cartesian coordinates.
 */
@interface PGRMath3DCartCoords : NSObject

/**
 The x-axis coordinate.
 */
@property (nonatomic, readwrite) double x;

/**
 The y-axis coordinate.
 */

@property (nonatomic, readwrite) double y;

/**
 The z-axis coordinate.
 */
@property (nonatomic, readwrite) double z;

/**
 Returns an object created from specified coordinates.
 @param x The x-axis coordinate.
 @param y The y-axis coordinate.
 @param z The z-axis coordinate.
 @return An object created from the specified coordinates.
 */
+(PGRMath3DCartCoords *)objectWithX:(double)x Y:(double)y Z:(double)z;

/**
 Initializes an object with specified coordinates.
 @param x The x-axis coordinate.
 @param y The y-axis coordinate.
 @param z The z-axis coordinate.
 @return An object initialized with the specified coordinates.
 */
-(instancetype)initWithX:(double)x Y:(double)y Z:(double)z;

/**
 Converts the three-dimensional Cartesian coordinates to spherical coordinates.
 @return A PGRMathSphCoords object containing the corresponding spherical coordinates.
 */
-(PGRMathSphCoords *)toSpherical;

@end


//  C helper function prototypes

/**
 Normalizes an angle in degrees into the range 0 <= angle < 360.
 @param angle The angle in degrees to normalize.
 @return The angle normalized into the range 0 <= angle < 360.
 */
double PGRMathNormalizeDegrees(const double angle);

/**
 Converts an angle from radians to degrees.
 @param radians The angle in radians to convert.
 @return The angle converted into degrees.
 */
double PGRMathRadiansToDegrees(const double radians);

/**
 Converts an angle from degrees to radians.
 @param degrees The angle in degrees to convert.
 @return The angle converted into radians.
 */
double PGRMathDegreesToRadians(const double degrees);

/**
 Converts an integer into Roman numerals.
 @param num The integer to convert, must be in the range 0 <= num < 5,000.
 @return A string containing the Roman numeral representation.
 */
NSString * PGRMathMakeRoman(const int num);

