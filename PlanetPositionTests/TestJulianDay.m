//
//  TestJulianDay.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//
//  The test cases in this group were taken from:
//
//    http://aa.usno.navy.mil/data/docs/JulianDate.php
//
//  on or around June 2, 2013.


#import <XCTest/XCTest.h>
#import "PGAstroGeneral.h"

@interface TestJulianDay : XCTestCase

@end

@implementation TestJulianDay

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJulianDayFirst
{
    const double accuracy = 0.000001;
    
    NSDateComponents * epochComponents = [NSDateComponents new];
    [epochComponents setYear:2013];
    [epochComponents setMonth:6];
    [epochComponents setDay:2];
    [epochComponents setHour:0];
    [epochComponents setMinute:0];
    [epochComponents setSecond:0];
    [epochComponents setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate * testDate = [gregorian dateFromComponents:epochComponents];
    
    const double jday = julian_day(testDate);
    XCTAssertEqualWithAccuracy(2456445.5, jday, accuracy);
}


- (void)testJulianDaySecond
{
    const double accuracy = 0.000001;
    
    NSDateComponents * epochComponents = [NSDateComponents new];
    [epochComponents setYear:1980];
    [epochComponents setMonth:1];
    [epochComponents setDay:1];
    [epochComponents setHour:0];
    [epochComponents setMinute:0];
    [epochComponents setSecond:0];
    [epochComponents setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate * testDate = [gregorian dateFromComponents:epochComponents];
    
    const double jday = julian_day(testDate);
    XCTAssertEqualWithAccuracy(2444239.5, jday, accuracy);
}


- (void)testJulianDayThird
{
    const double accuracy = 0.001;   //  Unknown why accuracy is lower here, other than date is more in the past,
                                     //  and result is a fraction.
    
    NSDateComponents * epochComponents = [NSDateComponents new];
    [epochComponents setYear:1918];
    [epochComponents setMonth:11];
    [epochComponents setDay:11];
    [epochComponents setHour:11];
    [epochComponents setMinute:11];
    [epochComponents setSecond:0];
    [epochComponents setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSCalendar * gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate * testDate = [gregorian dateFromComponents:epochComponents];
    
    const double jday = julian_day(testDate);
    XCTAssertEqualWithAccuracy(2421908.9661, jday, accuracy);
}

@end
