//
//  TestKepler.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//
//  Test cases were taken from:
//
//    http://www.jgiesen.de/kepler/kepler.html
//
//  on or around June 2, 2013.

#import <XCTest/XCTest.h>
#import "PGAstroGeneral.h"

@interface TestKepler : XCTestCase

@end

@implementation TestKepler

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

- (void)testKepler
{
    const double accuracy = 0.00001;
    
    double expectedResult = PGRMathDegreesToRadians(37.40006);
    double testResult = kepler(PGRMathDegreesToRadians(20), 0.5);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);

    expectedResult = PGRMathDegreesToRadians(48.43418);
    testResult = kepler(PGRMathDegreesToRadians(27), 0.5);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = PGRMathDegreesToRadians(226.66512);
    testResult = kepler(PGRMathDegreesToRadians(235), 0.2);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = PGRMathDegreesToRadians(0);
    testResult = kepler(PGRMathDegreesToRadians(0), 0);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = PGRMathDegreesToRadians(360);
    testResult = kepler(PGRMathDegreesToRadians(360), 0);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = PGRMathDegreesToRadians(300);
    testResult = kepler(PGRMathDegreesToRadians(300), 0);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = PGRMathDegreesToRadians(96.25884);
    testResult = kepler(PGRMathDegreesToRadians(45), 0.9);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
}

@end
