/*
 *  PGRAstroPlanet.h
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to abstract Planet base class. This class should not be directly instantiated.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGRAstroGeneral.h"
#import "PGRMathHelpers.h"


/**
 An abstract base class for all PGRAstro planets.
 @attention Do not directly instantiate this class.
 */
@interface PGRAstroPlanet : NSObject <NSCopying>
{
    /**
     The date used for all planetary calculations.
     */
    NSDate * _calcDate;
}


/**
 The orbital elements used for the planetary calculations.
 */
@property (strong, nonatomic, readonly) PGRAstroOrbElem * oes;

/**
 The right ascension of the planet, in degrees.
 @discussion Right ascension is the angular distance measured eastwards along the
 celestial equator (i.e. intersecting the orbital plane of the Earth) from the
 vernal equinox to the planet's center. It is the celestial equivalent of
 terrestrial longitude.
 */
@property (assign, nonatomic, readonly) double rightAscension;

/**
 The declination of the planet, in degrees.
 @discussion Declination is the angular distance of the planet's center from the
 celestial equator. It is the celestial equivalent of terrestrial latitude.
 */
@property (assign, nonatomic, readonly) double declination;

/**
 The distance of the planet. The units in which this is measured may vary by planet.
 */
@property (assign, nonatomic, readonly) double distance;

/**
 Returns an object initialized with a particular date and set of orbital elements.
 @param calcDate The date used for planetary calculations.
 @param oes The orbital elements to use for planetary calculations.
 @return An object initialized with the specified date and set of orbital elements.
 */
-(instancetype)initWithDate:(NSDate *)calcDate andOEs:(PGRAstroOrbElem *)oes;

/**
 Returns a new object of the same type, but recalculated for the current time.
 @discussion This method is provided for situations where an owner holds a planet object
 and wishes to get a new object updated for the current time, but may not be sure which
 type of object she has. The @c clone method allows the held object to produce a copy
 of itself.
 @return A new object of the same type, but recalculated for the current time.
 */
-(instancetype)clone;

/**
 Returns the three-dimensional Cartesian heliocentric orbital coordinates of the planet.
 @return The three-dimensional Cartesian heliocentric orbital coordinates of the planet.
 */
-(PGRMath3DCartCoords *)helioOrbCoords;

/**
 Returns the three-dimensional Cartesian heliocentric ecliptic coordinates of the planet.
 @return The three-dimensional Cartesian heliocentric ecliptic coordinates of the planet.
 */
-(PGRMath3DCartCoords *)helioEclCoords;

/**
 Returns the three-dimensional Cartesian geocentric ecliptic coordinates of the planet.
 @return The three-dimensional Cartesian geocentric ecliptic coordinates of the planet.
 */
-(PGRMath3DCartCoords *)geoEclCoords;

/**
 Returns the three-dimensional Cartesian geocentric equatorial coordinates of the planet.
 @return The three-dimensional Cartesian geocentric equatorial coordinates of the planet.
 */
-(PGRMath3DCartCoords *)geoEquCoords;

/**
 Returns the name of the planet.
 @return A string containing the name of the planet.
 */
-(NSString *)name;


@end
