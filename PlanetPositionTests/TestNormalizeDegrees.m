//
//  TestNormalizeDegrees.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGMathHelpers.h"

@interface TestNormalizeDegrees : XCTestCase

@end

@implementation TestNormalizeDegrees

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

- (void)testNormalizeDegrees
{
    const double accuracy = 0.00001;
    
    double testResult = normalizeDegrees(50);
    XCTAssertEqualWithAccuracy(50, testResult, accuracy);
    
    testResult = normalizeDegrees(400);
    XCTAssertEqualWithAccuracy(40, testResult, accuracy);
    
    testResult = normalizeDegrees(-60);
    XCTAssertEqualWithAccuracy(300, testResult, accuracy);
    
    testResult = normalizeDegrees(-460);
    XCTAssertEqualWithAccuracy(260, testResult, accuracy);
    
    testResult = normalizeDegrees(500);
    XCTAssertEqualWithAccuracy(140, testResult, accuracy);
    
    testResult = normalizeDegrees(360);
    XCTAssertEqualWithAccuracy(0, testResult, accuracy);
    
    testResult = normalizeDegrees(0);
    XCTAssertEqualWithAccuracy(0, testResult, accuracy);
}

@end
