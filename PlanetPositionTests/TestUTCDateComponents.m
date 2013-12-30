//
//  TestUTCDateComponents.m
//  planet-pos
//
//  Created by Paul Griffiths on 12/29/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGRDateHelpers.h"

@interface TestUTCDateComponents : XCTestCase

@end

@implementation TestUTCDateComponents

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

- (void)testUTCDateComponents
{
    NSDate * testDate = PGRDateGetUTCDate(2012, 6, 10, 19, 33, 16);
    NSDateComponents * testComponents = PGRDateGetUTCComponentsFromDate(testDate);
    
    XCTAssertEqual(testComponents.year, 2012);
    XCTAssertEqual(testComponents.month, 6);
    XCTAssertEqual(testComponents.day, 10);
    XCTAssertEqual(testComponents.hour, 19);
    XCTAssertEqual(testComponents.minute, 33);
    XCTAssertEqual(testComponents.second, 16);
}

@end
