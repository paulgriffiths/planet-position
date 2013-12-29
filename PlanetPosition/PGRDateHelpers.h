/*
 *  PGRDateHelpers.h
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Interface to date utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import <Foundation/Foundation.h>


//  C helper function prototypes


/**
 Returns an NSDate object corresponding to a specified UTC date.
 @param year The year of the UTC date.
 @param month The month of the UTC date, in the range 1 to 12.
 @param day The day of the UTC date, in the range 1 to 31.
 @param hour The hour of the UTC date, in the range 0 to 23.
 @param minute The minute of the UTC date, in the range 0 to 59.
 @param second The second of the UTC date, in the range 0 to 59.
 @return An NSDate object corresponding to the specified UTC date.
 */
NSDate * PGRDateGetUTCDate(int year, int month, int day, int hour, int minute, int second);

/**
 Returns an NSDateComponents object with the UTC year, month, day, hour, minute and second
 corresponding to a specified NSDate.
 @param calcDate The specified NSDate.
 @return An NSDateComponents object with the UTC year, month, day, hour, minute and second
 corresponding to a specified NSDate.
 */
NSDateComponents * PGRDateGetUTCComponentsFromDate(NSDate * calcDate);