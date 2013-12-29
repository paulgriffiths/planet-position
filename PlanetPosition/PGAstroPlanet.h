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
#import "PGMathHelpers.h"


@interface PGAstroPlanet : NSObject {
    NSDate * _calcDate;                 //  Calculation date
}


//  Properties

@property (strong, nonatomic) PGAstroOrbElem * oes;
@property (nonatomic, readonly) double rightAscension;
@property (nonatomic, readonly) double declination;
@property (nonatomic, readonly) double distance;


//  Public methods

-(instancetype)initWithDate:(NSDate *)calcDate andOEs:(PGAstroOrbElem *)oes;
-(instancetype)clone;

-(PGMathRectCoords *)helioOrbCoords;
-(PGMathRectCoords *)helioEclCoords;
-(PGMathRectCoords *)geoEclCoords;
-(PGMathRectCoords *)geoEquCoords;

-(NSString *)name;


@end
