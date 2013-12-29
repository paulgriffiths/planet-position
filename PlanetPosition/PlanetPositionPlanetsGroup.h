/*
 *  PlanetPositionPlanetsGroup.h
 *  ============================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to class for maintaining a full list of planets.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGRAstro.h"


@interface PlanetPositionPlanetsGroup : NSObject

-(void)update;
-(NSUInteger)numPlanets;
-(PGAstroPlanet *)planetAtIndex:(long)index;

@end
