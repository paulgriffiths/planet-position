/*
 *  PGAstroPlanets.m
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of classes for major solar system planets.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGAstroPlanets.h"


//  Mercury class

@implementation PGAstroMercury


//  Initialization methods

- (PGAstroMercury *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroMercury *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:0.387009927 Ecc:0.20563593
                                                                Inc:7.00497902 Ml:252.25032350 Lp:77.45779628 Lan:48.33076593];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:0.00000037 Ecc:0.00001906
                                                               Inc:-0.00594749 Ml:149472.67411175 Lp:0.16047689 Lan:-0.12534081];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Mercury";
}


@end


//  Venus class

@implementation PGAstroVenus


//  Initialization methods

- (PGAstroVenus *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroVenus *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:0.72333566 Ecc:0.00677672
                                                                Inc:3.39467605 Ml:181.97909950 Lp:131.60246718 Lan:76.67984255];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:0.00000390 Ecc:-0.00004107
                                                               Inc:-0.00078890 Ml:58517.81538729 Lp:0.00268329 Lan:-0.27769418];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Venus";
}


@end


//  Sun class

@implementation PGAstroSun


//  Initialization methods

- (PGAstroSun *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroSun *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:0 Ecc:0 Inc:0 Ml:0 Lp:0 Lan:0];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:0 Ecc:0 Inc:0 Ml:0 Lp:0 Lan:0];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Override methods for calculating heliocentric coordinates to return [0, 0, 0],
//  since heliocentric coordinates for the Sun are always zero by definition.

- (PGAstroRectCoords *)helioOrbCoords {
    return [[PGAstroRectCoords alloc] initWithX:0 Y:0 Z:0];
}


- (PGAstroRectCoords *)helioEclCoords {
    return [[PGAstroRectCoords alloc] initWithX:0 Y:0 Z:0];
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Sun";
}


@end


//  Mars class

@implementation PGAstroMars


//  Initialization methods

- (PGAstroMars *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroMars *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:1.52371034 Ecc:0.09339410
                                                                Inc:1.84969142 Ml:-4.55343205 Lp:-23.94362959 Lan:49.55953891];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:0.00001847 Ecc:0.00007882
                                                               Inc:-0.00813131 Ml:19140.30268499 Lp:0.44441088 Lan:-0.29257343];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Mars";
}


@end


//  Jupiter class

@implementation PGAstroJupiter


//  Initialization methods

- (PGAstroJupiter *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroJupiter *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:5.20288700 Ecc:0.04838624
                                                                Inc:1.30439695 Ml:34.39644051 Lp:14.72847983 Lan:100.47390909];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:-0.00011607 Ecc:-0.00013253
                                                               Inc:-0.00183714 Ml:3034.74612775 Lp:0.21252668 Lan:0.20469106];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Jupiter";
}


@end


//  Saturn class

@implementation PGAstroSaturn


//  Initialization methods

- (PGAstroSaturn *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroSaturn *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:9.53667594 Ecc:0.05386179
                                                                Inc:2.48599187 Ml:49.95424423 Lp:92.59887831 Lan:113.66242448];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:-0.00125060 Ecc:-0.00050991
                                                               Inc:0.00193609 Ml:1222.49362201 Lp:-0.41897216 Lan:-0.28867794];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Saturn";
}


@end


//  Uranus class

@implementation PGAstroUranus


//  Initialization methods

- (PGAstroUranus *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroUranus *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:19.18916464 Ecc:0.04725744
                                                                Inc:0.77263783 Ml:313.23810451 Lp:170.95427630 Lan:74.01692503];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:-0.00196176 Ecc:-0.00004397
                                                               Inc:-0.00242939 Ml:428.48202785 Lp:0.40805281 Lan:0.04240589];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Uranus";
}


@end


//  Neptune class

@implementation PGAstroNeptune


//  Initialization methods

- (PGAstroNeptune *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroNeptune *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:30.06992276 Ecc:0.00859048
                                                                Inc:1.77004347 Ml:-55.12002969 Lp:44.96476227 Lan:131.78422574];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:0.00026291 Ecc:0.00005105
                                                               Inc:0.00035372 Ml:218.45945325 Lp:-0.32241464 Lan:-0.00508664];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Neptune";
}


@end


//  Pluto class

@implementation PGAstroPluto


//  Initialization methods

- (PGAstroPluto *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroPluto *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:39.48211675 Ecc:0.24882730
                                                                Inc:17.14001206 Ml:238.92903833 Lp:224.06891629 Lan:110.30393684];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:-0.00031596 Ecc:0.00005170
                                                               Inc:0.00004818 Ml:145.20780515 Lp:-0.04062942 Lan:-0.01183482];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Method returns the name of the planet

-(NSString *)name {
    return @"Pluto";
}


@end


//  Earth class

@implementation PGAstroEarth


//  Initialization methods

- (PGAstroEarth *)init {
    return [self initWithDate:[NSDate new]];
}


- (PGAstroEarth *)initWithDate:(NSDate *)date {
    PGAstroOrbElem * j2000OEs = [[PGAstroOrbElem alloc] initWithSma:1.00000261 Ecc:0.01671123
                                 Inc:-0.00001531 Ml:100.46457166 Lp:102.93768193 Lan:0];
    PGAstroOrbElem * centOEs = [[PGAstroOrbElem alloc] initWithSma:0.00000562 Ecc:-0.00004392
                                Inc:-0.01294668 Ml:35999.37244981 Lp:0.32327364 Lan:0];
    
    self = [super initWithDate:date andJ2000OEs:j2000OEs andCenturyOEs:centOEs];
    return self;
}


//  Override methods for calculating geocentric coordinates to return [0, 0, 0],
//  since geocentric coordinates for the Earth are always zero by definition.

- (PGAstroRectCoords *)geoOrbCoords {
    return [[PGAstroRectCoords alloc] initWithX:0 Y:0 Z:0];
}


- (PGAstroRectCoords *)geoEclCoords {
    return [[PGAstroRectCoords alloc] initWithX:0 Y:0 Z:0];
}


@end
