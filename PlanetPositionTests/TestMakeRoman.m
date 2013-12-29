//
//  TestPGRMathMakeRoman.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGRMathHelpers.h"

@interface TestPGRMathMakeRoman : XCTestCase

@end

@implementation TestPGRMathMakeRoman

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


//  Test PGRMathMakeRoman() returns the correct numeral for the range 0-4,999

- (void)testConversion
{
    XCTAssertTrue([@"0" isEqualToString:PGRMathMakeRoman(0)]);
    XCTAssertTrue([@"I" isEqualToString:PGRMathMakeRoman(1)]);
    XCTAssertTrue([@"III" isEqualToString:PGRMathMakeRoman(3)]);
    XCTAssertTrue([@"VI" isEqualToString:PGRMathMakeRoman(6)]);
    XCTAssertTrue([@"VIII" isEqualToString:PGRMathMakeRoman(8)]);
    XCTAssertTrue([@"IX" isEqualToString:PGRMathMakeRoman(9)]);
    XCTAssertTrue([@"X" isEqualToString:PGRMathMakeRoman(10)]);
    XCTAssertTrue([@"XI" isEqualToString:PGRMathMakeRoman(11)]);
    XCTAssertTrue([@"XIV" isEqualToString:PGRMathMakeRoman(14)]);
    XCTAssertTrue([@"XVII" isEqualToString:PGRMathMakeRoman(17)]);
    XCTAssertTrue([@"XIX" isEqualToString:PGRMathMakeRoman(19)]);
    XCTAssertTrue([@"XX" isEqualToString:PGRMathMakeRoman(20)]);
    XCTAssertTrue([@"XXXIV" isEqualToString:PGRMathMakeRoman(34)]);
    XCTAssertTrue([@"XLIX" isEqualToString:PGRMathMakeRoman(49)]);
    XCTAssertTrue([@"L" isEqualToString:PGRMathMakeRoman(50)]);
    XCTAssertTrue([@"LXIX" isEqualToString:PGRMathMakeRoman(69)]);
    XCTAssertTrue([@"LXXIII" isEqualToString:PGRMathMakeRoman(73)]);
    XCTAssertTrue([@"LXXXV" isEqualToString:PGRMathMakeRoman(85)]);
    XCTAssertTrue([@"XCIII" isEqualToString:PGRMathMakeRoman(93)]);
    XCTAssertTrue([@"C" isEqualToString:PGRMathMakeRoman(100)]);
    XCTAssertTrue([@"CI" isEqualToString:PGRMathMakeRoman(101)]);
    XCTAssertTrue([@"CXXX" isEqualToString:PGRMathMakeRoman(130)]);
    XCTAssertTrue([@"CDXVIII" isEqualToString:PGRMathMakeRoman(418)]);
    XCTAssertTrue([@"DCCLXXVII" isEqualToString:PGRMathMakeRoman(777)]);
    XCTAssertTrue([@"MCMLXXXIV" isEqualToString:PGRMathMakeRoman(1984)]);
    XCTAssertTrue([@"MMI" isEqualToString:PGRMathMakeRoman(2001)]);
    XCTAssertTrue([@"MMMCCCI" isEqualToString:PGRMathMakeRoman(3301)]);
    XCTAssertTrue([@"MMMMD" isEqualToString:PGRMathMakeRoman(4500)]);
    XCTAssertTrue([@"MMMMCMXCIX" isEqualToString:PGRMathMakeRoman(4999)]);
}


//  Test PGRMathMakeRoman() returns nil when the argument is outside of the range 0-4,999

- (void)testConversionNil
{
    XCTAssertNil(PGRMathMakeRoman(-1));
    XCTAssertNil(PGRMathMakeRoman(5000));
}
@end
