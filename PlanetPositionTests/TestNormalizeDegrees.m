//
//  TestPGRMathNormalizeDegrees.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGRMathHelpers.h"

@interface TestPGRMathNormalizeDegrees : XCTestCase

@end

@implementation TestPGRMathNormalizeDegrees

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

- (void)testPGRMathNormalizeDegrees
{
    const double accuracy = 0.00001;
    
    double testResult = PGRMathNormalizeDegrees(50);
    XCTAssertEqualWithAccuracy(50, testResult, accuracy);
    
    testResult = PGRMathNormalizeDegrees(400);
    XCTAssertEqualWithAccuracy(40, testResult, accuracy);
    
    testResult = PGRMathNormalizeDegrees(-60);
    XCTAssertEqualWithAccuracy(300, testResult, accuracy);
    
    testResult = PGRMathNormalizeDegrees(-460);
    XCTAssertEqualWithAccuracy(260, testResult, accuracy);
    
    testResult = PGRMathNormalizeDegrees(500);
    XCTAssertEqualWithAccuracy(140, testResult, accuracy);
    
    testResult = PGRMathNormalizeDegrees(360);
    XCTAssertEqualWithAccuracy(0, testResult, accuracy);
    
    testResult = PGRMathNormalizeDegrees(0);
    XCTAssertEqualWithAccuracy(0, testResult, accuracy);
}

@end
