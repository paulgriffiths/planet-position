/*
 *  PGRDateHelpers.m
 *  ================
 *  Copyright 2013 Paul Griffiths
 *  Email: mail@paulgriffiths.net
 *
 *  Implementation of date utility classes and helper functions.
 *
 *  Distributed under the terms of the GNU General Public License.
 *  http://www.gnu.org/licenses/
 */


#import "PGRDateHelpers.h"


NSDate * PGRDateGetUTCDate(int year, int month, int day, int hour, int minute, int second) {
    NSDateComponents * epochComponents = [NSDateComponents new];
    epochComponents.year = year;
    epochComponents.month = month;
    epochComponents.day = day;
    epochComponents.hour = hour;
    epochComponents.minute = minute;
    epochComponents.second = second;
    epochComponents.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorian dateFromComponents:epochComponents];
}


NSDateComponents * PGRDateGetUTCComponentsFromDate(NSDate * calcDate) {
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |
                           NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    return [gregorian components:unitFlags fromDate:calcDate];
}


