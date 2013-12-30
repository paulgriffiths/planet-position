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


/**
 Class to hold a collection of all supported planets.
 */
@interface PlanetPositionPlanetsGroup : NSObject

/**
 Updates the collection of planets as of the current time.
 */
-(void)update;

/**
 Returns the number of planets in the collection.
 @return The number of planets in the collection.
 */
-(NSUInteger)numPlanets;

/**
 Returns the planet at the specified index.
 @param index The index of the requested planet.
 @return The planet at the specified index.
 */
-(PGRAstroPlanet *)planetAtIndex:(long)index;

@end
