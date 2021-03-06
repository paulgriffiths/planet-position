/*
 *  PGRAstroMoonBase.m
 *  ==================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of abstract base class for the Moon. 
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRAstroMoonBase.h"
#import "PGRAstroMoon.h"
#import "PGRDateHelpers.h"


@implementation PGRAstroMoonBase


- (instancetype)initWithDate:(NSDate *)calcDate
                       andY2000OEs:(PGRAstroOrbElem *)y2000Oes andDayOEs:(PGRAstroOrbElem *)dayOes {
    PGRAstroOrbElem * oes = [PGRAstroOrbElem objectWithY2000EpochElements:y2000Oes dayElements:dayOes atDate:calcDate convertToRadians:YES];
    self = [super initWithDate:calcDate andOEs:oes];
    return self;
}


- (PGRMath3DCartCoords *)geoEclCoords {
    PGRMath3DCartCoords * hoc = [self helioOrbCoords];
    PGRMath3DCartCoords * hec = [self helioEclCoords];
    PGRMath3DCartCoords * gec = [PGRMath3DCartCoords new];
    
    double lon = atan2(hec.y, hec.x);
    double lat = atan2(hec.z, hypot(hec.x, hec.y));
    double rhc = hoc.z;
    
    PGRAstroSunForMoon * sunForMoon = [[PGRAstroSunForMoon alloc] initWithDate:_calcDate];
    
    //  Calculate mean elongation and argument
    //  of latitude for the moon.
    
    const double mel = self.oes.ml - sunForMoon.oes.ml;
    const double arl = self.oes.ml - self.oes.lan;
    
    //  Adjust for longitude perturbations
    
    double dlon = -1.274 * sin(self.oes.man - 2 * mel);
    dlon += 0.658 * sin(2 * mel);
    dlon -= 0.186 * sin(sunForMoon.oes.man);
    dlon -= 0.059 * sin(2 * self.oes.man - 2 * mel);
    dlon -= 0.057 * sin(self.oes.man - 2 * mel + sunForMoon.oes.man);
    dlon += 0.053 * sin(self.oes.man + 2 * mel);
    dlon += 0.046 * sin(2 * self.oes.ml - sunForMoon.oes.man);
    dlon += 0.041 * sin(self.oes.man - sunForMoon.oes.man);
    dlon -= 0.035 * sin(self.oes.ml);
    dlon -= 0.031 * sin(self.oes.man + sunForMoon.oes.man);
    dlon -= 0.015 * sin(2 * arl - 2 * mel);
    dlon += 0.011 * sin(self.oes.man - 4 * mel);
    lon = PGRMathDegreesToRadians(dlon) + lon;
    
    //  Adjust for latitude perturbations
    
    double dlat = -0.173 * sin(arl - 2 * mel);
    dlat -= 0.055 * sin(self.oes.man - arl - 2 * mel);
    dlat -= 0.046 * sin(self.oes.man + arl - 2 * mel);
    dlat += 0.033 * sin(arl + 2 * mel);
    dlat += 0.017 * sin(2 * self.oes.man + arl);
    lat = PGRMathDegreesToRadians(dlat) + lat;
    
    //  Adjust for rhc perturbations
    
    rhc = rhc - 0.58 * cos(self.oes.man - 2 * mel);
    rhc -= 0.46 * cos(2 * mel);
    
    //  Calculate cartesian coordinates of geocentric lunar position
    
    gec.x = rhc * cos(lon) * cos(lat);
    gec.y = rhc * sin(lon) * cos(lat);
    gec.z = rhc * sin(lat);
    
    return gec;
}


@end
