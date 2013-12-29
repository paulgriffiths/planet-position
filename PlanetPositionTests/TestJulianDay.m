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
#import "PGRDateHelpers.h"

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
    
    const double jday = julian_day(PGRDateGetUTCDate(2013, 6, 2, 0, 0, 0));
    XCTAssertEqualWithAccuracy(2456445.5, jday, accuracy);
}


- (void)testJulianDaySecond
{
    const double accuracy = 0.000001;
    
    const double jday = julian_day(PGRDateGetUTCDate(1980, 1, 1, 0, 0, 0));
    XCTAssertEqualWithAccuracy(2444239.5, jday, accuracy);
}


- (void)testJulianDayThird
{
    const double accuracy = 0.001;   //  Unknown why accuracy is lower here, other than date is more in the past,
                                     //  and result is a fraction.
    
    const double jday = julian_day(PGRDateGetUTCDate(1918, 11, 11, 11, 11, 0));
    XCTAssertEqualWithAccuracy(2421908.9661, jday, accuracy);
}

@end
