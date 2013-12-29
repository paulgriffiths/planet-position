//
//  TestRascToZodiac.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGRAstroGeneral.h"

@interface TestRascToZodiac : XCTestCase

@end

@implementation TestRascToZodiac

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

- (void)testRascToZodiac
{
    NSString * expectedResult;
    NSString * testResult;
    
    testResult = PGRAstroRascToZodiac(0);
    expectedResult = @"00AR00";
    XCTAssertTrue([expectedResult isEqualToString:testResult]);
    
    testResult = PGRAstroRascToZodiac(30);
    expectedResult = @"00TA00";
    XCTAssertTrue([expectedResult isEqualToString:testResult]);
    
    testResult = PGRAstroRascToZodiac(65.5);
    expectedResult = @"05GE30";
    XCTAssertTrue([expectedResult isEqualToString:testResult]);
    
    testResult = PGRAstroRascToZodiac(145.7);
    expectedResult = @"25LE42";
    XCTAssertTrue([expectedResult isEqualToString:testResult]);
    
    testResult = PGRAstroRascToZodiac(325.2);
    expectedResult = @"25AQ12";
    XCTAssertTrue([expectedResult isEqualToString:testResult]);
}

@end
