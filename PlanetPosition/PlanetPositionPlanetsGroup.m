/*
 *  PlanetPositionPlanetsGroup.m
 *  ============================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of class for maintaining a full list of planets.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PlanetPositionPlanetsGroup.h"
#import "PGRAstro.h"


@implementation PlanetPositionPlanetsGroup {
    /**
     A mutable array containing the collection of planets.
     */
    NSMutableArray * _planetsList;
}


- (instancetype)init {
    if ( (self = [super init]) ) {
        _planetsList = [NSMutableArray new];
        [self update];
    }
    
    return self;
}


- (void)update {
    [_planetsList removeAllObjects];
    
    [_planetsList addObject:[PGRAstroMoon new]];
    [_planetsList addObject:[PGRAstroMercury new]];
    [_planetsList addObject:[PGRAstroVenus new]];
    [_planetsList addObject:[PGRAstroSun new]];
    [_planetsList addObject:[PGRAstroMars new]];
    [_planetsList addObject:[PGRAstroJupiter new]];
    [_planetsList addObject:[PGRAstroSaturn new]];
    [_planetsList addObject:[PGRAstroUranus new]];
    [_planetsList addObject:[PGRAstroNeptune new]];
    [_planetsList addObject:[PGRAstroPluto new]];
}


- (NSUInteger)numPlanets {
    return _planetsList.count;
}


- (PGRAstroPlanet *)planetAtIndex:(long)index {
    return [_planetsList[index] copy];
}

@end
