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


//  Moon class

@interface PGAstroMoon : PGAstroMoonBase

/**
 Creates a new moon planet object.
 @param date the date to create it at
 @return a new object
 @see something for more info
 */
+(PGAstroMoon *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Sun for moon class, used only for calculating the positions of other
//  the Moon. Users should not instantiate this class.

@interface PGAstroSunForMoon : PGAstroMoonBase

+(PGAstroSunForMoon *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


