//
//  TestMakeRoman.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGAstro.h"

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


//  Test make_roman() returns the correct numeral for the range 0-4,999

- (void)testConversion
{
    XCTAssertTrue([@"0" isEqualToString:make_roman(0)]);
    XCTAssertTrue([@"I" isEqualToString:make_roman(1)]);
    XCTAssertTrue([@"III" isEqualToString:make_roman(3)]);
    XCTAssertTrue([@"VI" isEqualToString:make_roman(6)]);
    XCTAssertTrue([@"VIII" isEqualToString:make_roman(8)]);
    XCTAssertTrue([@"IX" isEqualToString:make_roman(9)]);
    XCTAssertTrue([@"X" isEqualToString:make_roman(10)]);
    XCTAssertTrue([@"XI" isEqualToString:make_roman(11)]);
    XCTAssertTrue([@"XIV" isEqualToString:make_roman(14)]);
    XCTAssertTrue([@"XVII" isEqualToString:make_roman(17)]);
    XCTAssertTrue([@"XIX" isEqualToString:make_roman(19)]);
    XCTAssertTrue([@"XX" isEqualToString:make_roman(20)]);
    XCTAssertTrue([@"XXXIV" isEqualToString:make_roman(34)]);
    XCTAssertTrue([@"XLIX" isEqualToString:make_roman(49)]);
    XCTAssertTrue([@"L" isEqualToString:make_roman(50)]);
    XCTAssertTrue([@"LXIX" isEqualToString:make_roman(69)]);
    XCTAssertTrue([@"LXXIII" isEqualToString:make_roman(73)]);
    XCTAssertTrue([@"LXXXV" isEqualToString:make_roman(85)]);
    XCTAssertTrue([@"XCIII" isEqualToString:make_roman(93)]);
    XCTAssertTrue([@"C" isEqualToString:make_roman(100)]);
    XCTAssertTrue([@"CI" isEqualToString:make_roman(101)]);
    XCTAssertTrue([@"CXXX" isEqualToString:make_roman(130)]);
    XCTAssertTrue([@"CDXVIII" isEqualToString:make_roman(418)]);
    XCTAssertTrue([@"DCCLXXVII" isEqualToString:make_roman(777)]);
    XCTAssertTrue([@"MCMLXXXIV" isEqualToString:make_roman(1984)]);
    XCTAssertTrue([@"MMI" isEqualToString:make_roman(2001)]);
    XCTAssertTrue([@"MMMCCCI" isEqualToString:make_roman(3301)]);
    XCTAssertTrue([@"MMMMD" isEqualToString:make_roman(4500)]);
    XCTAssertTrue([@"MMMMCMXCIX" isEqualToString:make_roman(4999)]);
}


//  Test make_roman() returns nil when the argument is outside of the range 0-4,999

- (void)testConversionNil
{
    XCTAssertNil(make_roman(-1));
    XCTAssertNil(make_roman(5000));
}
@end
