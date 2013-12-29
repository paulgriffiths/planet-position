/*
 *  PGPlanetDetails.h
 *  =================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to class holding various planet details.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGAstro.h"


@interface PGPlanetDetails : NSObject


//  Properties

@property (strong, nonatomic, readonly) NSString * name;
@property (strong, nonatomic, readonly) UIImage * imageSmall;
@property (strong, nonatomic, readonly) UIImage * imageLarge;
@property (strong, nonatomic, readonly) NSString * rascString;
@property (strong, nonatomic, readonly) NSString * declString;
@property (strong, nonatomic, readonly) NSString * distString;
@property (strong, nonatomic, readonly) NSString * zodSignName;
@property (strong, nonatomic, readonly) NSString * zodDecan;
@property (strong, nonatomic, readonly) NSString * zodCoords;


//  Methods

+(PGPlanetDetails *)objectWithPlanet:(PGAstroPlanet *)planet;
-(instancetype)initWithPlanet:(PGAstroPlanet *)planet;


@end
