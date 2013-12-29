/*
 *  PGRAstroMoon.m
 *  ==============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of class for the Moon.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRAstroMoon.h"


//  Moon class

@implementation PGAstroMoon


//  Public convenience class method to instantiate an object with a date

+ (PGAstroMoon *)planetWithDate:(NSDate *)date {
    return [[PGAstroMoon alloc] initWithDate:date];
}


//  Initialization methods

- (instancetype)init {
    return [self initWithDate:[NSDate new]];
}


- (instancetype)initWithDate:(NSDate *)date {
    PGAstroOrbElem * y2000OEs = [PGAstroOrbElem objectWithSma:60.2666 Ecc:0.0549
                                                                Inc:5.1454 Ml:198.5516 Lp:83.1862 Lan:125.1228];
    PGAstroOrbElem * dayOEs = [PGAstroOrbElem objectWithSma:0 Ecc:0
                                                               Inc:0 Ml:13.1763964649 Lp:0.111403514 Lan:-0.0529538083];
    
    self = [super initWithDate:date andY2000OEs:y2000OEs andDayOEs:dayOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Moon";
}


@end


//  Sun for Moon class

@implementation PGAstroSunForMoon


//  Public convenience class method to instantiate an object with a date

+ (PGAstroSunForMoon *)planetWithDate:(NSDate *)date {
    return [PGAstroSunForMoon planetWithDate:date];
}


//  Initialization methods

- (instancetype)init {
    return [self initWithDate:[NSDate new]];
}


- (instancetype)initWithDate:(NSDate *)date {
    PGAstroOrbElem * y2000OEs = [PGAstroOrbElem objectWithSma:1 Ecc:0.016709
                                                                Inc:0 Ml:278.9874 Lp:-77.0596 Lan:0];
    PGAstroOrbElem * dayOEs = [PGAstroOrbElem objectWithSma:0 Ecc:-0.000000001151
                                                              Inc:0 Ml:0.98564735200 Lp:0.00004709350 Lan:0];
    
    self = [super initWithDate:date andY2000OEs:y2000OEs andDayOEs:dayOEs];
    return self;
}


@end
