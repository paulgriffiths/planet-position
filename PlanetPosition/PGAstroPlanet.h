/*
 *  PGAstroPlanet.h
 *  ===============
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to abstract Planet base class. This class should not be directly instantiated.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGAstroGeneral.h"


@interface PGAstroPlanet : NSObject {
    NSDate * _calcDate;                 //  Calculation date
}


//  Property

@property (strong, nonatomic) PGAstroOrbElem * oes;


//  Public methods

-(PGAstroPlanet *)initWithDate:(NSDate *)calcDate andOEs:(PGAstroOrbElem *)oes;

-(PGAstroRectCoords *)helioOrbCoords;
-(PGAstroRectCoords *)helioEclCoords;
-(PGAstroRectCoords *)geoEclCoords;
-(PGAstroRectCoords *)geoEquCoords;

-(double)rightAscension;
-(double)declination;
-(double)distance;


@end
