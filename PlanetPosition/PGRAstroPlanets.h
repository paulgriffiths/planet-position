/*
 *  PGRAstroPlanets.h
 *  =================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to classes for major solar system planets.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGRAstroMajorBody.h"


/**
 A class to calculation astronomical information about the planet Mercury.
 */
@interface PGRAstroMercury : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroMercury *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Venus.
 */
@interface PGRAstroVenus : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroVenus *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the Sun.
 */
@interface PGRAstroSun : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroSun *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Mars.
 */
@interface PGRAstroMars : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroMars *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Jupiter.
 */
@interface PGRAstroJupiter : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroJupiter *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Saturn.
 */
@interface PGRAstroSaturn : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroSaturn *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Uranus.
 */
@interface PGRAstroUranus : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroUranus *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Neptune.
 */
@interface PGRAstroNeptune : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroNeptune *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Pluto.
 */
@interface PGRAstroPluto : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroPluto *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the planet Earth.
 @attention This class is used only in the calculations for the other planets. Do not directly
 instantiate this class.
 */
@interface PGRAstroEarth : PGRAstroMajorBody

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroEarth *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end
