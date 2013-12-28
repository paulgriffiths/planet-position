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
    
    double expectedResult = degToRad(37.40006);
    double testResult = kepler(degToRad(20), 0.5);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);

    expectedResult = degToRad(48.43418);
    testResult = kepler(degToRad(27), 0.5);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = degToRad(226.66512);
    testResult = kepler(degToRad(235), 0.2);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = degToRad(0);
    testResult = kepler(degToRad(0), 0);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = degToRad(360);
    testResult = kepler(degToRad(360), 0);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = degToRad(300);
    testResult = kepler(degToRad(300), 0);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
    
    expectedResult = degToRad(96.25884);
    testResult = kepler(degToRad(45), 0.9);
    XCTAssertEqualWithAccuracy(expectedResult, testResult, accuracy);
}

@end
