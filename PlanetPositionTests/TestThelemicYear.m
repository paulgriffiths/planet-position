//
//  TestThelemicYear.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGRAstro.h"
#import "PGRDateHelpers.h"

@interface TestThelemicYear : XCTestCase

@end

@implementation TestThelemicYear

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

- (void)testThelemicYear
{
    NSDate * testDate = PGRDateGetUTCDate(1904, 1, 19, 0, 0, 0);
    NSString * testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"Before New Era"]);

    testDate = PGRDateGetUTCDate(1904, 12, 21, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"0"]);
    
    testDate = PGRDateGetUTCDate(1905, 12, 21, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"1"]);
    
    testDate = PGRDateGetUTCDate(1925, 2, 21, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"20"]);
    
    testDate = PGRDateGetUTCDate(1925, 12, 21, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"21"]);

    testDate = PGRDateGetUTCDate(1926, 3, 19, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"21"]);
    
    testDate = PGRDateGetUTCDate(1926, 3, 25, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"I:0"]);
    
    testDate = PGRDateGetUTCDate(1926, 12, 21, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"I:0"]);

    testDate = PGRDateGetUTCDate(1955, 12, 21, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"II:7"]);

    testDate = PGRDateGetUTCDate(2013, 12, 21, 0, 0, 0);
    testString = PGRAstroGetThelemicYear(testDate);
    XCTAssertTrue([testString isEqualToString:@"IV:21"]);
}

@end
