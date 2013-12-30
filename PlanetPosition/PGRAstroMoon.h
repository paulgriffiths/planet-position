/*
 *  PGRAstroMoon.h
 *  ==============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to class for the Moon.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRAstroMoonBase.h"


/**
 A class to calculation astronomical information about the planet Mercury.
 */
@interface PGRAstroMoon : PGRAstroMoonBase

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroMoon *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end


/**
 A class to calculation astronomical information about the Sun.
 @attention This class is used only in the calculations for the Moon. Do not directly
 instantiate this class.
 */
@interface PGRAstroSunForMoon : PGRAstroMoonBase

/**
 Returns a planet object created with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object created with calculations as at the specified date.
 */
+(PGRAstroSunForMoon *)planetWithDate:(NSDate *)date;

/**
 Returns a planet object initialized with calculations as at a specified date.
 @param date The date for which to perform the planetary calculations.
 @return A planet object initialized with calculations as at the specified date.
 */
-(instancetype)initWithDate:(NSDate *)date;

@end



