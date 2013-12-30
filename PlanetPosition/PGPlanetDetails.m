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
    /**
     The planet for which information is maintained.
     */
    PGRAstroPlanet * _planet;
    
    /**
     A zodiac information object for the planet.
     */
    PGRAstroZodiacInfo * _zInfo;
}


+ (PGPlanetDetails *)objectWithPlanet:(PGRAstroPlanet *)planet {
    return [[PGPlanetDetails alloc] initWithPlanet:planet];
}


-(instancetype)initWithPlanet:(PGRAstroPlanet *)planet {
    if ( (self = [super init]) ) {
        _planet = planet;
        _zInfo = [PGRAstroZodiacInfo objectWithRasc:_planet.rightAscension];
    }
    return self;
}


- (NSString *)name {
    return _planet.name;
}


- (UIImage *)imageSmall {
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@_thumb", [_planet name]]];
}


- (UIImage *)imageLarge {
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@_large", [_planet name]]];
}


- (NSString *)rascString {
    return PGRAstroRascString(_planet.rightAscension);
}


- (NSString *)declString {
    return PGRAstroDeclString(_planet.declination);
}


- (NSString *)distString {
    return [NSString stringWithFormat:@"%.3f %@", _planet.distance,
            ([_planet.name isEqualToString:@"Moon"] ? @"Earth Radii" : @"AU")];
}


- (NSString *) zodSignName {
    return _zInfo.signName;
}


- (NSString *)zodDecan {
    return _zInfo.zodiacDecan;
}


- (NSString *)zodCoords {
    return PGRAstroRascToZodiac(_planet.rightAscension);
}


@end
