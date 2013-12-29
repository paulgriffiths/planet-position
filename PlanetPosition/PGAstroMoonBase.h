/*
 *  PGAstroMoonBase.h
 *  =================
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


#import "PGAstroPlanet.h"


@interface PGAstroMoonBase : PGAstroPlanet


//  Public class method

+ (PGAstroOrbElem *)calcOrbitalElementsForDate:(NSDate *)calcDate
                                   andY2000OEs:(PGAstroOrbElem *)y2000Oes andDayOEs:(PGAstroOrbElem *)dayOes;


//  Public instance method

- (instancetype)initWithDate:(NSDate *)calcDate
                       andY2000OEs:(PGAstroOrbElem *)y2000Oes andDayOEs:(PGAstroOrbElem *)dayOes;


@end
