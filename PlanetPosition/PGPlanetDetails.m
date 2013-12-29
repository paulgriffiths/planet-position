/*
 *  PGPlanetDetails.m
 *  =================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of class holding various planet details.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGPlanetDetails.h"


@implementation PGPlanetDetails {
    PGRAstroPlanet * _planet;
    PGRAstroZodiacInfo * _zInfo;
}


//  Class method to create object from planet

+ (PGPlanetDetails *)objectWithPlanet:(PGRAstroPlanet *)planet {
    return [[PGPlanetDetails alloc] initWithPlanet:planet];
}


//  Initialization method to initialize object with planet

-(instancetype)initWithPlanet:(PGRAstroPlanet *)planet {
    if ( (self = [super init]) ) {
        _planet = planet;
        _zInfo = [PGRAstroZodiacInfo objectWithRasc:_planet.rightAscension];
    }
    return self;
}


//  Returns the planet's name

- (NSString *)name {
    return _planet.name;
}


//  Returns a small (43 x 43) image of the planet

- (UIImage *)imageSmall {
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@_thumb", [_planet name]]];
}


//  Returns a large (100 x 100) image of the planet

- (UIImage *)imageLarge {
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@_large", [_planet name]]];
}


//  Returns an HMS NSString representation of the planet's right ascension

- (NSString *)rascString {
    return PGRAstroRascString(_planet.rightAscension);
}


//  Returns a DMS NSString representation of the planet's declination

- (NSString *)declString {
    return PGRAstroDeclString(_planet.declination);
}


//  Returns a string representation of the planet's distance, either AU or
//  Earth radii, as appropriate

- (NSString *)distString {
    return [NSString stringWithFormat:@"%.3f %@", _planet.distance,
            ([_planet.name isEqualToString:@"Moon"] ? @"Earth Radii" : @"AU")];
}


//  Returns a string containing the sign of the zodiac the planet is in
- (NSString *) zodSignName {
    return _zInfo.signName;
}


//  Returns a string containing the decan of the sign of the zodiac the planet is in

- (NSString *)zodDecan {
    return _zInfo.zodiacDecan;
}


//  Returns a string representation of the planet's zodiac coordinates

- (NSString *)zodCoords {
    return PGRAstroRascToZodiac(_planet.rightAscension);
}


@end
