//
//  PGAstroGeneral.h
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PGAstroHMS : NSObject

@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@end


@interface PGAstroDMS : NSObject

@property (nonatomic) int degrees;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@end


@interface PGAstroZodiacInfo : NSObject

@property (nonatomic) double rightAscension;
@property (nonatomic) int signIndex;
@property (strong, nonatomic) NSString * signName;
@property (strong, nonatomic) NSString * signShortName;
@property (strong, nonatomic) PGAstroDMS * zodiacDMS;

@end


@interface PGAstroSphCoords : NSObject

@property (nonatomic) double rightAscension;
@property (nonatomic) double declination;
@property (nonatomic) double distance;

@end


@interface PGAstroRectCoords : NSObject

@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;

-(PGAstroSphCoords *)toSpherical;

@end


@interface PGAstroOrbElem : NSObject

@property (nonatomic) double sma;
@property (nonatomic) double ecc;
@property (nonatomic) double inc;
@property (nonatomic) double ml;
@property (nonatomic) double lp;
@property (nonatomic) double lan;
@property (nonatomic) double man;
@property (nonatomic) double arp;

@end


@interface PGAstroGeneral : NSObject

@end


//  C helper function prototypes

double normalize_degrees(const double angle);
double degrees(const double rads);
double radians(const double degs);
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
