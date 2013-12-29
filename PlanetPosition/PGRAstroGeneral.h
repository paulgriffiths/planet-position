/*
 *  PGRAstroGeneral.h
 *  =================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to astronomical utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>
#import "PGRMathHelpers.h"


//  Class to store information about the zodiacal position of a right ascension measurement

@interface PGRAstroZodiacInfo : NSObject

@property (nonatomic) double rightAscension;
@property (nonatomic) int signIndex;
@property (strong, nonatomic) NSString * signName;
@property (strong, nonatomic) NSString * signShortName;
@property (strong, nonatomic) PGRMathDMS * zodiacDMS;
@property (strong, nonatomic) NSString * zodiacDecan;

+(PGRAstroZodiacInfo *)objectWithRasc:(double)rasc;
-(instancetype)initWithRasc:(double)rasc;


@end


//  Class to store a set of Keplerian elements

@interface PGRAstroOrbElem : NSObject

@property (nonatomic) double sma;
@property (nonatomic) double ecc;
@property (nonatomic) double inc;
@property (nonatomic) double ml;
@property (nonatomic) double lp;
@property (nonatomic) double lan;
@property (nonatomic) double man;
@property (nonatomic) double arp;

+(PGRAstroOrbElem *)objectWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan;

-(instancetype)initWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan;

@end


//  C helper function prototypes

double PGRAstroJulianDay(const NSDate * dateObject);
double PGRAstroKepler(const double m_anom, const double ecc);
NSString * PGRAstroZodiacSign(const double rasc);
NSString * PGRAstroZodiacSignShort(const double rasc);
NSString * PGRAstroRascToZodiac(const double rasc);
NSString * PGRAstroRascString(const double rasc);
NSString * PGRAstroDeclString(const double decl);
NSString * PGRAstroGetThelemicYear(NSDate * date);


