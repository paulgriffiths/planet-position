/*
 *  PGAstroMoon.h
 *  =============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to class for the Moon.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGAstroMoonBase.h"


//  Moon class

@interface PGAstroMoon : PGAstroMoonBase

+(PGAstroMoon *)planetWithDate:(NSDate *)date;

-(PGAstroMoon *)initWithDate:(NSDate *)date;

@end


//  Sun for moon class, used only for calculating the positions of other
//  the Moon. Users should not instantiate this class.

@interface PGAstroSunForMoon : PGAstroMoonBase

+(PGAstroSunForMoon *)planetWithDate:(NSDate *)date;

-(PGAstroSunForMoon *)initWithDate:(NSDate *)date;

@end



