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
#import "PGRAstro.h"


/**
 A class to provide image and string information about a planet.
 */
@interface PGPlanetDetails : NSObject


/**
 The name of the planet.
 */
@property (strong, nonatomic, readonly) NSString * name;

/**
 A small (43x43) thumbnail image of the planet.
 */
@property (strong, nonatomic, readonly) UIImage * imageSmall;

/**
 A large (100x100) image of the planet.
 */
@property (strong, nonatomic, readonly) UIImage * imageLarge;

/**
 An hours-minutes-seconds string representation of the planet's right ascension.
 */
@property (strong, nonatomic, readonly) NSString * rascString;

/**
 A degrees-minutes-seconds string representation of the planet's declination.
 */
@property (strong, nonatomic, readonly) NSString * declString;

/**
 A string representation of the planet's distance, including units.
 */
@property (strong, nonatomic, readonly) NSString * distString;

/**
 The name of the zodiac sign in which the planet currently is.
 */
@property (strong, nonatomic, readonly) NSString * zodSignName;

/**
 The name of the decan of the zodiac sign in which the planet currently is.
 */
@property (strong, nonatomic, readonly) NSString * zodDecan;

/**
 A string representation of the current zodiacal coordinates of the planet.
 */
@property (strong, nonatomic, readonly) NSString * zodCoords;

/**
 Returns an object created with a specified planet.
 @param planet The specified planet with which to create the object.
 @return An object created with the specified planet.
 */
+(PGPlanetDetails *)objectWithPlanet:(PGRAstroPlanet *)planet;

/**
 Returns an object initialized with a specified planet.
 @param planet The specified planet with which to create the object.
 @return An object initialized with the specified planet.
 */
-(instancetype)initWithPlanet:(PGRAstroPlanet *)planet;


@end
