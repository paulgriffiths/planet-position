//
//  TestRascAndDeclStrings.m
//  planet-pos
//
//  Created by Paul Griffiths on 12/29/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGRAstro.h"

@interface TestRascAndDeclStrings : XCTestCase

@end

@implementation TestRascAndDeclStrings

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

- (void)testDeclString
{
    double testDecl = 0.5;
    NSString * expectedString = @"+00\u00B0 30m 00s";
    NSString * testString = PGRAstroDeclString(testDecl);
    XCTAssertTrue([testString isEqualToString:expectedString]);
    
    testDecl = -0.5;
    expectedString = @"-00\u00B0 30m 00s";
    testString = PGRAstroDeclString(testDecl);
    XCTAssertTrue([testString isEqualToString:expectedString]);
    
    testDecl = 1.75;
    expectedString = @"+01\u00B0 45m 00s";
    testString = PGRAstroDeclString(testDecl);
    XCTAssertTrue([testString isEqualToString:expectedString]);
    
    testDecl = -1.75;
    expectedString = @"-01\u00B0 45m 00s";
    testString = PGRAstroDeclString(testDecl);
    XCTAssertTrue([testString isEqualToString:expectedString]);
    
    testDecl = 44.783;
    expectedString = @"+44\u00B0 46m 58s";
    testString = PGRAstroDeclString(testDecl);
    XCTAssertTrue([testString isEqualToString:expectedString]);
    
    testDecl = -44.783;
    expectedString = @"-44\u00B0 46m 58s";
    testString = PGRAstroDeclString(testDecl);
    XCTAssertTrue([testString isEqualToString:expectedString]);
}

- (void)testRascString
{
    double testRasc = 0.5;
    NSString * expectedString = @"00h 02m 00s";
    NSString * testString = PGRAstroRascString(testRasc);
    XCTAssertTrue([testString isEqualToString:expectedString]);

    testRasc = 23;
    expectedString = @"01h 32m 00s";
    testString = PGRAstroRascString(testRasc);
    XCTAssertTrue([testString isEqualToString:expectedString]);
    
    testRasc = 277;
    expectedString = @"18h 28m 00s";
    testString = PGRAstroRascString(testRasc);
    XCTAssertTrue([testString isEqualToString:expectedString]);
    
    testRasc = 303.443;
    expectedString = @"20h 13m 46s";
    testString = PGRAstroRascString(testRasc);
    XCTAssertTrue([testString isEqualToString:expectedString]);
}

@end
