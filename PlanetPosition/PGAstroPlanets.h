/*
 *  PGAstroPlanets.h
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to classes for major solar system planets.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGAstroMajorBody.h"


//  Mercury class

@interface PGAstroMercury : PGAstroMajorBody

+(PGAstroMercury *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Venus class

@interface PGAstroVenus : PGAstroMajorBody

+(PGAstroVenus *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Sun class

@interface PGAstroSun : PGAstroMajorBody

+(PGAstroSun *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Mars class

@interface PGAstroMars : PGAstroMajorBody

+(PGAstroMars *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Jupiter class

@interface PGAstroJupiter : PGAstroMajorBody

+(PGAstroJupiter *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Saturn class

@interface PGAstroSaturn : PGAstroMajorBody

+(PGAstroSaturn *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Uranus class

@interface PGAstroUranus : PGAstroMajorBody

+(PGAstroUranus *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Neptune class

@interface PGAstroNeptune : PGAstroMajorBody

+(PGAstroNeptune *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Pluto class

@interface PGAstroPluto : PGAstroMajorBody

+(PGAstroPluto *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end


//  Earth class, used only for calculating positions of other planets. Users
//  should not instantiate this class.

@interface PGAstroEarth : PGAstroMajorBody

+(PGAstroEarth *)planetWithDate:(NSDate *)date;

-(instancetype)initWithDate:(NSDate *)date;

@end
