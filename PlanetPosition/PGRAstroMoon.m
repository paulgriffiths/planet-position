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


@implementation PGRAstroMoon


+ (PGRAstroMoon *)planetWithDate:(NSDate *)date {
    return [[PGRAstroMoon alloc] initWithDate:date];
}


- (instancetype)init {
    return [self initWithDate:[NSDate new]];
}


- (instancetype)initWithDate:(NSDate *)date {
    PGRAstroOrbElem * y2000OEs = [PGRAstroOrbElem objectWithSma:60.2666 Ecc:0.0549
                                                                Inc:5.1454 Ml:198.5516 Lp:83.1862 Lan:125.1228];
    PGRAstroOrbElem * dayOEs = [PGRAstroOrbElem objectWithSma:0 Ecc:0
                                                               Inc:0 Ml:13.1763964649 Lp:0.111403514 Lan:-0.0529538083];
    
    self = [super initWithDate:date andY2000OEs:y2000OEs andDayOEs:dayOEs];
    return self;
}


-(NSString *)name {
    return @"Moon";
}


@end


@implementation PGRAstroSunForMoon


+ (PGRAstroSunForMoon *)planetWithDate:(NSDate *)date {
    return [PGRAstroSunForMoon planetWithDate:date];
}


- (instancetype)init {
    return [self initWithDate:[NSDate new]];
}


- (instancetype)initWithDate:(NSDate *)date {
    PGRAstroOrbElem * y2000OEs = [PGRAstroOrbElem objectWithSma:1 Ecc:0.016709
                                                                Inc:0 Ml:278.9874 Lp:-77.0596 Lan:0];
    PGRAstroOrbElem * dayOEs = [PGRAstroOrbElem objectWithSma:0 Ecc:-0.000000001151
                                                              Inc:0 Ml:0.98564735200 Lp:0.00004709350 Lan:0];
    
    self = [super initWithDate:date andY2000OEs:y2000OEs andDayOEs:dayOEs];
    return self;
}


@end
