//
//  PlanetPositionPlanetsGroup.h
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/26/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAstro.h"

@interface PlanetPositionPlanetsGroup : NSObject

-(void)update;
-(NSUInteger)numPlanets;
-(PGAstroPlanet *)planetAtIndex:(long)index;

@end
