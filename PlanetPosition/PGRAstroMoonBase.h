/*
 *  PGRAstroMoonBase.h
 *  ==================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to abstract base class for the Moon. This class should not be directly instantiated.
 *
 *  This class has nothing to do with bases on the Moon, domed or otherwise.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRAstroPlanet.h"


/**
 An abstract base class for the Moon and helper Sun planet.
 @attention Do not directly instantiate this class.
 */
@interface PGRAstroMoonBase : PGRAstroPlanet


/**
 Initializes an object with the orbital elements at a specified date based on the Y2000 epoch.
 @param calcDate The date to use to calculate the orbital elements.
 @param y2000Oes The orbital elements of the planet at midnight on the morning of December 31, 1999.
 @param dayOes The change in the orbital elements of the planet per day.
 @returns An object initialized to be calculated as at the specified date, based on the Y2000 epoch.
 */
- (instancetype)initWithDate:(NSDate *)calcDate
                       andY2000OEs:(PGRAstroOrbElem *)y2000Oes andDayOEs:(PGRAstroOrbElem *)dayOes;


@end
