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


/**
 An abstract base class for all major solar system planets, including the Sun.
 @attention Do not directly instantiate this class.
 */
@interface PGRAstroMajorBody : PGRAstroPlanet


/**
 Initializes an object with the orbital elements at a specified date based on the J2000 epoch.
 @param calcDate The date to use to calculate the orbital elements.
 @param j2000Oes The orbital elements of the planet at the J2000 epoch.
 @param centOes The change in the orbital elements of the planet per Julian Century (365.25 days).
 @returns An object initialized to be calculated as at the specified date, based on the J2000 epoch.
 */
- (instancetype)initWithDate:(NSDate *)calcDate
                       andJ2000OEs:(PGRAstroOrbElem *)j2000Oes andCenturyOEs:(PGRAstroOrbElem *)centOes;


@end
