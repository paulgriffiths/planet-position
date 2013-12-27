//
//  PlanetPositionPlanetsGroup.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/26/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PlanetPositionPlanetsGroup.h"
#import "PGAstro.h"


@implementation PlanetPositionPlanetsGroup {
    NSMutableArray * _planetsList;
}


-(PlanetPositionPlanetsGroup *)init {
    if ( (self = [super init]) ) {
        _planetsList = [NSMutableArray new];
        [self update];
    }
    
    return self;
}


-(void)update {
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


-(NSUInteger)numPlanets {
    return _planetsList.count;
}


-(PGAstroPlanet *)planetAtIndex:(long)index {
    return _planetsList[index];
}

@end
