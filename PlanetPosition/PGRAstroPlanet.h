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


@interface PGRAstroPlanet : NSObject {
    NSDate * _calcDate;                 //  Calculation date
}


//  Properties

@property (strong, nonatomic) PGRAstroOrbElem * oes;
@property (nonatomic, readonly) double rightAscension;
@property (nonatomic, readonly) double declination;
@property (nonatomic, readonly) double distance;


//  Public methods

-(instancetype)initWithDate:(NSDate *)calcDate andOEs:(PGRAstroOrbElem *)oes;
-(instancetype)clone;

-(PGRMath3DCartCoords *)helioOrbCoords;
-(PGRMath3DCartCoords *)helioEclCoords;
-(PGRMath3DCartCoords *)geoEclCoords;
-(PGRMath3DCartCoords *)geoEquCoords;

-(NSString *)name;


@end
