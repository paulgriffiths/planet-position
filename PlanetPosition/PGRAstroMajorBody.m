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


- (instancetype)initWithDate:(NSDate *)calcDate
                       andJ2000OEs:(PGRAstroOrbElem *)j2000Oes andCenturyOEs:(PGRAstroOrbElem *)centOes {
    PGRAstroOrbElem * oes = [PGRAstroOrbElem objectWithJ2000EpochElements:j2000Oes julianCenturyElements:centOes
                                                                   atDate:calcDate convertToRadians:YES];
    self = [super initWithDate:calcDate andOEs:oes];
    return self;
}


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
