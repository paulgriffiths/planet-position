//
//  TestMakeRoman.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGMathHelpers.h"

@interface TestMakeRoman : XCTestCase

@end

@implementation TestMakeRoman

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


//  Test makeRoman() returns the correct numeral for the range 0-4,999

- (void)testConversion
{
    XCTAssertTrue([@"0" isEqualToString:makeRoman(0)]);
    XCTAssertTrue([@"I" isEqualToString:makeRoman(1)]);
    XCTAssertTrue([@"III" isEqualToString:makeRoman(3)]);
    XCTAssertTrue([@"VI" isEqualToString:makeRoman(6)]);
    XCTAssertTrue([@"VIII" isEqualToString:makeRoman(8)]);
    XCTAssertTrue([@"IX" isEqualToString:makeRoman(9)]);
    XCTAssertTrue([@"X" isEqualToString:makeRoman(10)]);
    XCTAssertTrue([@"XI" isEqualToString:makeRoman(11)]);
    XCTAssertTrue([@"XIV" isEqualToString:makeRoman(14)]);
    XCTAssertTrue([@"XVII" isEqualToString:makeRoman(17)]);
    XCTAssertTrue([@"XIX" isEqualToString:makeRoman(19)]);
    XCTAssertTrue([@"XX" isEqualToString:makeRoman(20)]);
    XCTAssertTrue([@"XXXIV" isEqualToString:makeRoman(34)]);
    XCTAssertTrue([@"XLIX" isEqualToString:makeRoman(49)]);
    XCTAssertTrue([@"L" isEqualToString:makeRoman(50)]);
    XCTAssertTrue([@"LXIX" isEqualToString:makeRoman(69)]);
    XCTAssertTrue([@"LXXIII" isEqualToString:makeRoman(73)]);
    XCTAssertTrue([@"LXXXV" isEqualToString:makeRoman(85)]);
    XCTAssertTrue([@"XCIII" isEqualToString:makeRoman(93)]);
    XCTAssertTrue([@"C" isEqualToString:makeRoman(100)]);
    XCTAssertTrue([@"CI" isEqualToString:makeRoman(101)]);
    XCTAssertTrue([@"CXXX" isEqualToString:makeRoman(130)]);
    XCTAssertTrue([@"CDXVIII" isEqualToString:makeRoman(418)]);
    XCTAssertTrue([@"DCCLXXVII" isEqualToString:makeRoman(777)]);
    XCTAssertTrue([@"MCMLXXXIV" isEqualToString:makeRoman(1984)]);
    XCTAssertTrue([@"MMI" isEqualToString:makeRoman(2001)]);
    XCTAssertTrue([@"MMMCCCI" isEqualToString:makeRoman(3301)]);
    XCTAssertTrue([@"MMMMD" isEqualToString:makeRoman(4500)]);
    XCTAssertTrue([@"MMMMCMXCIX" isEqualToString:makeRoman(4999)]);
}


//  Test makeRoman() returns nil when the argument is outside of the range 0-4,999

- (void)testConversionNil
{
    XCTAssertNil(makeRoman(-1));
    XCTAssertNil(makeRoman(5000));
}
@end
