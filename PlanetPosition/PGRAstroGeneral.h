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


/**
 A class to store information about the zodiacal position of an object at a given right ascension.
 */
@interface PGRAstroZodiacInfo : NSObject

/**
 The right ascension.
 */
@property (assign, nonatomic, readonly) double rightAscension;

/**
 A zero-based index of the zodiacal sign, where 0 is Aries, and 11 is Pisces.
 */
@property (assign, nonatomic, readonly) int signIndex;

/**
 A string containing the full name of the zodiacal sign, e.g. "Scorpio".
 */
@property (strong, nonatomic, readonly) NSString * signName;

/**
 A string containing a short two-character name of the zodiacal sign, e.g. "SC" for "Scorpio".
 */
@property (strong, nonatomic, readonly) NSString * signShortName;

/**
 A PGRMathDMS object containing the whole degrees, minutes, and seconds of the right ascension.
 */
@property (strong, nonatomic, readonly) PGRMathDMS * zodiacDMS;

/**
 A string containing the decan of the current zodiacal sign.
 */
@property (strong, nonatomic, readonly) NSString * zodiacDecan;

/**
 Returns an object created with a specified right ascension.
 @param rasc The right ascension.
 @return An object created with the specified right ascension.
 */
+(PGRAstroZodiacInfo *)objectWithRasc:(double)rasc;

/**
 Initializes an object created with a specified right ascension.
 @param rasc The right ascension.
 @return An object initialized with the specified right ascension.
 */
-(instancetype)initWithRasc:(double)rasc;


@end


/**
 A class to store a set of Keplerian elements.
 */
@interface PGRAstroOrbElem : NSObject

/**
 The semimajor axis, the sum of the periapsis and apoapsis distances divided by two.
 */
@property (assign, nonatomic, readonly) double sma;

/**
 The eccentricity, or shape of the ellipse.
 */
@property (assign, nonatomic, readonly) double ecc;

/**
 The inclination, or vertical tilt of the ellipse measured at the ascending node.
 */
@property (assign, nonatomic, readonly) double inc;

/**
 The mean longitude.
 */
@property (assign, nonatomic, readonly) double ml;

/**
 The longitude of periapsis.
 */
@property (assign, nonatomic, readonly) double lp;

/**
 The longitude of the ascending node.
 */
@property (assign, nonatomic, readonly) double lan;

/**
 The mean anomaly at epoch.
 */
@property (assign, nonatomic, readonly) double man;

/**
 The argument of periapsis.
 */
@property (assign, nonatomic, readonly) double arp;

/**
 Returns an orbital elements object created with six specified elements. The other two
 elements are automatically calculated.
 @param sma The semimajor axis.
 @param ecc The eccentricity.
 @param inc The inclination.
 @param ml The mean longitude.
 @param lp The longitude of periapsis.
 @param lan The longitude of the ascending node.
 @return An orbital elements object created with the six specified elements. The other
 two elements are automatically calculated.
 */
+(PGRAstroOrbElem *)objectWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan;

/**
 Returns an orbital elements object initialized with six specified elements. The other two
 elements are automatically calculated.
 @param sma The semimajor axis.
 @param ecc The eccentricity.
 @param inc The inclination.
 @param ml The mean longitude.
 @param lp The longitude of periapsis.
 @param lan The longitude of the ascending node.
 @return An orbital elements object initialized with the six specified elements. The other
 two elements are automatically calculated.
 */
-(instancetype)initWithSma:(double)sma Ecc:(double)ecc Inc:(double)inc Ml:(double)ml Lp:(double)lp Lan:(double)lan;

/**
 Returns an orbital elements object created at a specified time away from an epoch.
 @param epochOEs The orbital elements at the epoch.
 @param periodOEs The change in orbital elements per time period.
 @param numPeriods The number of periods after the epoch (or before, if negative).
 @param radConvert Set to @c YES if @c epochOEs and @c periodOEs are measured in degrees, and the returned
 objected should be measured in radians. Set to @c NO to preserve the units in @c epochOEs and @c periodOEs.
 @return An orbital elements object created for the specified time away from the epoch.
 */
+(instancetype)objectWithEpochElements:(PGRAstroOrbElem *)epochOEs periodElements:(PGRAstroOrbElem *)periodOEs
                         numberPeriods:(double)numPeriods convertToRadians:(BOOL)radConvert;

@end


//  C helper function prototypes


/**
 Returns the Julian Day corresponding to a specified date.
 @param dateObject The specified date.
 @return The Julian Day corresponding to the specified date.
 */
double PGRAstroJulianDay(const NSDate * dateObject);


/**
 Solves Kepler's equation.
 @param m_anom The mean anomaly, in radians.
 @param ecc The eccentricity.
 @return The eccentric anomaly, in radians.
 */
double PGRAstroKepler(const double m_anom, const double ecc);


/**
 Returns the sign of the zodiac containing a specified right ascension.
 @param rasc The right ascension, in degrees.
 @return A string containing the name of the sign of the zodiac containing the specified right ascension.
 */
NSString * PGRAstroZodiacSign(const double rasc);


/**
 Returns the short-form sign of the zodiac containing a specified right ascension.
 @param rasc The right ascension, in degrees.
 @return A string containing the short-form name of the sign of the zodiac (e.g. "SC" for Scorpio)
 containing the specified right ascension.
 */
NSString * PGRAstroZodiacSignShort(const double rasc);


/**
 Returns the zodiacal coordinates of a specified right ascension in the form "20GE19", representing
 20 degrees and 19 minutes into the sign of Gemini.
 @param rasc The right ascension, in degrees.
 @return A string containing the calculated zodiacal coordinates.
 */
NSString * PGRAstroRascToZodiac(const double rasc);


/**
 Returns a string representation in the form "12h 10m 30s" of the hours-minutes-seconds representation
 of a specified right ascension.
 @param rasc The right ascension, in degrees.
 @return A string containing the hours-minutes-seconds representation of the specified right ascension.
 */
NSString * PGRAstroRascString(const double rasc);


/**
 Returns a string representation in the form "+12d 10m 30s" of the degrees-minutes-seconds representation
 of a specified right ascension.
 @param decl The right ascension, in degrees.
 @return A string containing the degrees-minutes-seconds representation of the specified right ascension.
 */
NSString * PGRAstroDeclString(const double decl);


/**
 Returns a string representation of the Thelemic year corresponding to a given NSDate.
 Thelemic years are represented in the form XX:YY, where XX is a Roman numeral equal to
 the number of full 22 solar year cycles between the spring equinox of 1904 and the current
 date (this is left blank if zero) and YY is the number of full solar years since the
 beginning of the current 22 year cycle. For instance, a date in May 1904 would have the
 Thelemic year "0", a date in August 1925 would have the Thelemic year "21", and a date in
 April 1926 would have the Thelemic year "I:0".
 @param date An NSDate object containing the desired date.
 @return A string containing the Thelemic year representation.
 @see http://oto-usa.org/thelema/calendar/ for more on Thelemic dates.
 */
NSString * PGRAstroGetThelemicYear(NSDate * date);

