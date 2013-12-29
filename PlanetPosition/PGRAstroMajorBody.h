/*
 *  PGRAstroMajorBody.h
 *  ===================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to abstract base class for major solar system planets. This class should not be directly instantiated.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGRAstroPlanet.h"


@interface PGRAstroMajorBody : PGRAstroPlanet


//  Public class method

+ (PGRAstroOrbElem *)calcOrbitalElementsForDate:(NSDate *)calcDate
                                      andJ2000OEs:(PGRAstroOrbElem *)j2000Oes andCenturyOEs:(PGRAstroOrbElem *)centOes;


//  Public instance method

- (instancetype)initWithDate:(NSDate *)calcDate
                       andJ2000OEs:(PGRAstroOrbElem *)j2000Oes andCenturyOEs:(PGRAstroOrbElem *)centOes;


@end
