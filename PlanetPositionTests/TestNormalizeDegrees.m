//
//  TestNormalizeDegrees.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGAstroGeneral.h"

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
    
    double testResult = normalize_degrees(50);
    XCTAssertEqualWithAccuracy(50, testResult, accuracy);
    
    testResult = normalize_degrees(400);
    XCTAssertEqualWithAccuracy(40, testResult, accuracy);
    
    testResult = normalize_degrees(-60);
    XCTAssertEqualWithAccuracy(300, testResult, accuracy);
    
    testResult = normalize_degrees(-460);
    XCTAssertEqualWithAccuracy(260, testResult, accuracy);
    
    testResult = normalize_degrees(500);
    XCTAssertEqualWithAccuracy(140, testResult, accuracy);
    
    testResult = normalize_degrees(360);
    XCTAssertEqualWithAccuracy(0, testResult, accuracy);
    
    testResult = normalize_degrees(0);
    XCTAssertEqualWithAccuracy(0, testResult, accuracy);
}

@end
