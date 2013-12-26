/*
 *  PGAstroMajorBody.h
 *  ==================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to abstract base class for major solar system planets.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGAstroMajorBody.h"
#import "PGAstroPlanets.h"


@implementation PGAstroMajorBody


//  Public class method to calculate orbital elements for:
//   - the specified calculation date;
//   - the specified orbital elements at the J2000 epoch; and
//   - the specified change in orbital elements per Julian century

+ (PGAstroOrbElem *)calcOrbitalElementsForDate:(NSDate *)calcDate
                                      andJ2000OEs:(PGAstroOrbElem *)j2000Oes andCenturyOEs:(PGAstroOrbElem *)centOes {
    static const double epochJ2000 = 2451545;
    static const double jdaysPerCent = 36525;
    const double jcents = (julian_day(calcDate) - epochJ2000) / jdaysPerCent;
    
    PGAstroOrbElem * oes = [PGAstroOrbElem new];
    
    oes.sma = j2000Oes.sma + centOes.sma * jcents;
    oes.ecc = j2000Oes.ecc + centOes.ecc * jcents;
    oes.inc = radians(j2000Oes.inc + centOes.inc * jcents);
    oes.ml = radians(j2000Oes.ml + centOes.ml * jcents);
    oes.lp = radians(j2000Oes.lp + centOes.lp * jcents);
    oes.lan = radians(j2000Oes.lan + centOes.lan * jcents);
    oes.man = oes.ml - oes.lp;
    oes.arp = oes.lp - oes.lan;
    
    return oes;
}



//  Public initialization method

- (PGAstroMajorBody *)initWithDate:(NSDate *)calcDate
                       andJ2000OEs:(PGAstroOrbElem *)j2000Oes andCenturyOEs:(PGAstroOrbElem *)centOes {
    PGAstroOrbElem * oes = [PGAstroMajorBody calcOrbitalElementsForDate:calcDate andJ2000OEs:j2000Oes andCenturyOEs:centOes];
    self = [super initWithDate:calcDate andOEs:oes];
    return self;
}


//  Overriden public instance method to calculate the planet's geocentric ecliptic coordinates

- (PGAstroRectCoords *)geoEclCoords {
    PGAstroEarth * earth = [[PGAstroEarth alloc] initWithDate:_calcDate];
    PGAstroRectCoords * eec = [earth helioEclCoords];
    PGAstroRectCoords * hec = [self helioEclCoords];
    PGAstroRectCoords * gec = [PGAstroRectCoords new];
    
    gec.x = hec.x - eec.x;
    gec.y = hec.y - eec.y;
    gec.z = hec.z - eec.z;

    return gec;
}


@end
