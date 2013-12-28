/*
 *  PGDateHelpers.h
 *  ===============
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

NSDate * getUTCDate(int year, int month, int day, int hour, int minute, int second);
NSDateComponents * getUTCComponentsFromDate(NSDate * calcDate);