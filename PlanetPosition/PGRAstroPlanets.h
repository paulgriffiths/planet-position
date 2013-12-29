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


//  Mercury class

@interface PGRAstroMercury : PGRAstroMajorBody

+(PGRAstroMercury *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Venus class

@interface PGRAstroVenus : PGRAstroMajorBody

+(PGRAstroVenus *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Sun class

@interface PGRAstroSun : PGRAstroMajorBody

+(PGRAstroSun *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Mars class

@interface PGRAstroMars : PGRAstroMajorBody

+(PGRAstroMars *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Jupiter class

@interface PGRAstroJupiter : PGRAstroMajorBody

+(PGRAstroJupiter *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Saturn class

@interface PGRAstroSaturn : PGRAstroMajorBody

+(PGRAstroSaturn *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Uranus class

@interface PGRAstroUranus : PGRAstroMajorBody

+(PGRAstroUranus *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Neptune class

@interface PGRAstroNeptune : PGRAstroMajorBody

+(PGRAstroNeptune *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Pluto class

@interface PGRAstroPluto : PGRAstroMajorBody

+(PGRAstroPluto *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Earth class, used only for calculating positions of other planets. Users
//  should not instantiate this class.

@interface PGRAstroEarth : PGRAstroMajorBody

+(PGRAstroEarth *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end
