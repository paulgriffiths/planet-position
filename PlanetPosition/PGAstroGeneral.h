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
#import "PGMathHelpers.h"


//  Class to store information about the zodiacal position of a right ascension measurement

@interface PGAstroZodiacInfo : NSObject

@property (nonatomic) double rightAscension;
@property (nonatomic) int signIndex;
@property (strong, nonatomic) NSString * signName;
@property (strong, nonatomic) NSString * signShortName;
@property (strong, nonatomic) PGMathDMS * zodiacDMS;

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

+(PGAstroOrbElem *)objectWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan;

-(PGAstroOrbElem *)initWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan;

@end


//  C helper function prototypes

PGAstroZodiacInfo * get_zodiac_info(const double rasc);
double julian_day(const NSDate * dateObject);
double kepler(const double m_anom, const double ecc);
NSString * zodiac_sign(const double rasc);
NSString * zodiac_sign_short(const double rasc);
NSString * rasc_to_zodiac(const double rasc);
NSString * rasc_string(const double rasc);
NSString * decl_string(const double decl);
NSString * get_thelemic_year(NSDate * date);


