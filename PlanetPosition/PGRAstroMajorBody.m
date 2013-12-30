/*
 *  PGRAstroMajorBody.h
 *  ===================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to abstract base class for major solar system planets.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRAstroMajorBody.h"
#import "PGRAstroPlanets.h"


@implementation PGRAstroMajorBody


//  Public class method to calculate orbital elements for:
//   - the specified calculation date;
//   - the specified orbital elements at the J2000 epoch; and
//   - the specified change in orbital elements per Julian century

+ (PGRAstroOrbElem *)calcOrbitalElementsForDate:(NSDate *)calcDate
                                      andJ2000OEs:(PGRAstroOrbElem *)j2000Oes andCenturyOEs:(PGRAstroOrbElem *)centOes {
    static const double epochJ2000 = 2451545;
    static const double jdaysPerCent = 36525;
    const double jcents = (PGRAstroJulianDay(calcDate) - epochJ2000) / jdaysPerCent;
    return [PGRAstroOrbElem objectWithEpochElements:j2000Oes periodElements:centOes numberPeriods:jcents convertToRadians:YES];
}



//  Public initialization method

- (instancetype)initWithDate:(NSDate *)calcDate
                       andJ2000OEs:(PGRAstroOrbElem *)j2000Oes andCenturyOEs:(PGRAstroOrbElem *)centOes {
    PGRAstroOrbElem * oes = [PGRAstroMajorBody calcOrbitalElementsForDate:calcDate andJ2000OEs:j2000Oes andCenturyOEs:centOes];
    self = [super initWithDate:calcDate andOEs:oes];
    return self;
}


//  Overriden public instance method to calculate the planet's geocentric ecliptic coordinates

- (PGRMath3DCartCoords *)geoEclCoords {
    PGRAstroEarth * earth = [PGRAstroEarth planetWithDate:_calcDate];
    PGRMath3DCartCoords * eec = [earth helioEclCoords];
    PGRMath3DCartCoords * hec = [self helioEclCoords];
    PGRMath3DCartCoords * gec = [PGRMath3DCartCoords new];
    
    gec.x = hec.x - eec.x;
    gec.y = hec.y - eec.y;
    gec.z = hec.z - eec.z;

    return gec;
}


@end
