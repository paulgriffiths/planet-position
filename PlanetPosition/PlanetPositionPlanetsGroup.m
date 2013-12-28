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
#import "PGAstro.h"


@implementation PlanetPositionPlanetsGroup {
    NSMutableArray * _planetsList;
}


//  Initialization method to create the array and give it its first update

- (PlanetPositionPlanetsGroup *)init {
    if ( (self = [super init]) ) {
        _planetsList = [NSMutableArray new];
        [self update];
    }
    
    return self;
}


//  Method to empty the list and fill it with newly-calculated planets as of the current time

- (void)update {
    [_planetsList removeAllObjects];
    
    [_planetsList addObject:[PGAstroMoon new]];
    [_planetsList addObject:[PGAstroMercury new]];
    [_planetsList addObject:[PGAstroVenus new]];
    [_planetsList addObject:[PGAstroSun new]];
    [_planetsList addObject:[PGAstroMars new]];
    [_planetsList addObject:[PGAstroJupiter new]];
    [_planetsList addObject:[PGAstroSaturn new]];
    [_planetsList addObject:[PGAstroUranus new]];
    [_planetsList addObject:[PGAstroNeptune new]];
    [_planetsList addObject:[PGAstroPluto new]];
}


//  Returns the number of planets in the list

- (NSUInteger)numPlanets {
    return _planetsList.count;
}


//  Returns the planet at the specified index

- (PGAstroPlanet *)planetAtIndex:(long)index {
    return _planetsList[index];
}

@end
