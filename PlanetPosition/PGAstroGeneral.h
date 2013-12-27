/*
 *  PGAstroGeneral.h
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to astronomical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>


//  Class to store an hours, minutes and seconds representation

@interface PGAstroHMS : NSObject

@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@end


//  Class to store a degrees, minutes and seconds representation

@interface PGAstroDMS : NSObject

@property (nonatomic) int degrees;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@end


//  Class to store information about the zodiacal position of a right ascension measurement

@interface PGAstroZodiacInfo : NSObject

@property (nonatomic) double rightAscension;
@property (nonatomic) int signIndex;
@property (strong, nonatomic) NSString * signName;
@property (strong, nonatomic) NSString * signShortName;
@property (strong, nonatomic) PGAstroDMS * zodiacDMS;

@end


//  Class to store spherical coordinates

@interface PGAstroSphCoords : NSObject

@property (nonatomic) double rightAscension;
@property (nonatomic) double declination;
@property (nonatomic) double distance;

@end


//  Class to store three-dimensional rectangular coordinates

@interface PGAstroRectCoords : NSObject

@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;

-(PGAstroRectCoords *)initWithX:(double)x Y:(double)y Z:(double)z;
-(PGAstroSphCoords *)toSpherical;

@end


//  Class to store a set of Keplerian elements

@interface PGAstroOrbElem : NSObject

@property (nonatomic) double sma;
@property (nonatomic) double ecc;
@property (nonatomic) double inc;
@property (nonatomic) double ml;
@property (nonatomic) double lp;
@property (nonatomic) double lan;
@property (nonatomic) double man;
@property (nonatomic) double arp;

-(PGAstroOrbElem *)initWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan;

@end


//  C helper function prototypes

double normalize_degrees(const double angle);
double degrees(const double rads);
double radians(const double degs);
NSDate * get_utc_date(int year, int month, int day, int hour, int minute, int second);
NSDateComponents * get_utc_components_from_date(NSDate * calcDate);
PGAstroHMS * deg_to_hms(const double degrees);
PGAstroDMS * deg_to_dms(const double degrees);
PGAstroZodiacInfo * get_zodiac_info(const double rasc);
double julian_day(const NSDate * dateObject);
double kepler(const double m_anom, const double ecc);
NSString * zodiac_sign(const double rasc);
NSString * zodiac_sign_short(const double rasc);
NSString * rasc_to_zodiac(const double rasc);
NSString * rasc_string(const double rasc);
NSString * decl_string(const double decl);
NSString * make_roman(const int num);
NSString * get_thelemic_year(NSDate * date);


