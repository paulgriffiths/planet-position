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

-(PGAstroMercury *)initWithDate:(NSDate *)date;

@end


//  Venus class

@interface PGAstroVenus : PGAstroMajorBody

-(PGAstroVenus *)initWithDate:(NSDate *)date;

@end


//  Sun class

@interface PGAstroSun : PGAstroMajorBody

-(PGAstroSun *)initWithDate:(NSDate *)date;

@end


//  Mars class

@interface PGAstroMars : PGAstroMajorBody

-(PGAstroMars *)initWithDate:(NSDate *)date;

@end


//  Jupiter class

@interface PGAstroJupiter : PGAstroMajorBody

-(PGAstroJupiter *)initWithDate:(NSDate *)date;

@end


//  Saturn class

@interface PGAstroSaturn : PGAstroMajorBody

-(PGAstroSaturn *)initWithDate:(NSDate *)date;

@end


//  Uranus class

@interface PGAstroUranus : PGAstroMajorBody

-(PGAstroUranus *)initWithDate:(NSDate *)date;

@end


//  Neptune class

@interface PGAstroNeptune : PGAstroMajorBody

-(PGAstroNeptune *)initWithDate:(NSDate *)date;

@end


//  Pluto class

@interface PGAstroPluto : PGAstroMajorBody

-(PGAstroPluto *)initWithDate:(NSDate *)date;

@end


//  Earth class, used only for calculating positions of other planets

@interface PGAstroEarth : PGAstroMajorBody

-(PGAstroEarth *)initWithDate:(NSDate *)date;

@end
