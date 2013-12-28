/*
 *  PGAstroPlanet.m
 *  ===============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of abstract Planet base class.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGAstroPlanet.h"


@implementation PGAstroPlanet


//  Initialization method

-(PGAstroPlanet *)initWithDate:(NSDate *)calcDate andOEs:(PGAstroOrbElem *)oes {
    if ( (self = [super init]) ) {
        _calcDate = calcDate;
        self.oes = oes;
    }
    
    return self;
}


//  Calculates the planet's heliocentric orbital coordinates

-(PGMathRectCoords *)helioOrbCoords {
    PGMathRectCoords * hoc = [PGMathRectCoords new];
    const double eAnom = kepler(_oes.man, _oes.ecc);
    
    hoc.x = _oes.sma * (cos(eAnom) - _oes.ecc);
    hoc.y = _oes.sma * sqrt(1 - pow(_oes.ecc, 2)) * sin(eAnom);
    hoc.z = hypot(hoc.x, hoc.y);
    
    return hoc;
}


//  Method to clone a planet with the current time

- (PGAstroPlanet *)clone {
    return [[self class] new];
}


//  Calculates the planet's heliocentric ecliptic coordinates

-(PGMathRectCoords *)helioEclCoords {
    PGMathRectCoords * hoc = [self helioOrbCoords];
    PGMathRectCoords * hec = [PGMathRectCoords new];
    
    hec.x = (((cos(_oes.arp) * cos(_oes.lan) -
               sin(_oes.arp) * sin(_oes.lan) * cos(_oes.inc)) * hoc.x) +
             ((-sin(_oes.arp) * cos(_oes.lan) -
               cos(_oes.arp) * sin(_oes.lan) * cos(_oes.inc)) * hoc.y));
    hec.y = (((cos(_oes.arp) * sin(_oes.lan) +
               sin(_oes.arp) * cos(_oes.lan) * cos(_oes.inc)) * hoc.x) +
             ((-sin(_oes.arp) * sin(_oes.lan) +
               cos(_oes.arp) * cos(_oes.lan) * cos(_oes.inc)) * hoc.y));
    hec.z = ((sin(_oes.arp) * sin(_oes.inc) * hoc.x) +
             (cos(_oes.arp) * sin(_oes.inc) * hoc.y));
    
    return hec;
}


//  Calculates the planet's geocentric ecliptic coordinates. This is a
//  placeholder method, which subclasses should override.

-(PGMathRectCoords *)geoEclCoords {
    return [PGMathRectCoords objectWithX:0 Y:0 Z:0];
}


//  Calculates the planet's geocentric equatorial coordinates.

-(PGMathRectCoords *)geoEquCoords {
    static const double obliquity = 0.40909261029685;
    PGMathRectCoords * gec = [self geoEclCoords];
    PGMathRectCoords * gqc = [PGMathRectCoords new];
    
    gqc.x = gec.x;
    gqc.y = gec.y * cos(obliquity) - gec.z * sin(obliquity);
    gqc.z = gec.y * sin(obliquity) + gec.z * cos(obliquity);
    
    return gqc;
}


//  Calculates the planet's right ascension

- (double)rightAscension {
    PGMathRectCoords * gqc = [self geoEquCoords];
    PGMathSphCoords * sph = [gqc toSpherical];
    return sph.rightAscension;
}


//  Calculates the planet's declination

-(double)declination {
    PGMathRectCoords * gqc = [self geoEquCoords];
    PGMathSphCoords * sph = [gqc toSpherical];
    return sph.declination;
}


//  Calculates the planet's distance

-(double)distance {
    PGMathRectCoords * gqc = [self geoEquCoords];
    PGMathSphCoords * sph = [gqc toSpherical];
    return sph.distance;
}


//  Returns a fake name

-(NSString *)name {
    return @"Do not instantiate this!";
}


@end
