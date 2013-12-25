//
//  TestZodiacNames.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGAstroGeneral.h"

@interface TestZodiacNames : XCTestCase

@end

@implementation TestZodiacNames

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

- (void)testZodiacName
{
    XCTAssertTrue([@"Aries" isEqualToString:zodiac_sign(0)]);
    XCTAssertTrue([@"Aries" isEqualToString:zodiac_sign(15)]);
    XCTAssertTrue([@"Aries" isEqualToString:zodiac_sign(29.9)]);
    XCTAssertTrue([@"Taurus" isEqualToString:zodiac_sign(30)]);
    XCTAssertTrue([@"Taurus" isEqualToString:zodiac_sign(45)]);
    XCTAssertTrue([@"Taurus" isEqualToString:zodiac_sign(59.9)]);
    XCTAssertTrue([@"Gemini" isEqualToString:zodiac_sign(60)]);
    XCTAssertTrue([@"Gemini" isEqualToString:zodiac_sign(75)]);
    XCTAssertTrue([@"Gemini" isEqualToString:zodiac_sign(89.9)]);
    XCTAssertTrue([@"Cancer" isEqualToString:zodiac_sign(90)]);
    XCTAssertTrue([@"Cancer" isEqualToString:zodiac_sign(105)]);
    XCTAssertTrue([@"Cancer" isEqualToString:zodiac_sign(119.9)]);
    XCTAssertTrue([@"Leo" isEqualToString:zodiac_sign(120)]);
    XCTAssertTrue([@"Leo" isEqualToString:zodiac_sign(135)]);
    XCTAssertTrue([@"Leo" isEqualToString:zodiac_sign(149.9)]);
    XCTAssertTrue([@"Virgo" isEqualToString:zodiac_sign(150)]);
    XCTAssertTrue([@"Virgo" isEqualToString:zodiac_sign(165)]);
    XCTAssertTrue([@"Virgo" isEqualToString:zodiac_sign(179.9)]);
    XCTAssertTrue([@"Libra" isEqualToString:zodiac_sign(180)]);
    XCTAssertTrue([@"Libra" isEqualToString:zodiac_sign(195)]);
    XCTAssertTrue([@"Libra" isEqualToString:zodiac_sign(209.9)]);
    XCTAssertTrue([@"Scorpio" isEqualToString:zodiac_sign(210)]);
    XCTAssertTrue([@"Scorpio" isEqualToString:zodiac_sign(225)]);
    XCTAssertTrue([@"Scorpio" isEqualToString:zodiac_sign(239.9)]);
    XCTAssertTrue([@"Sagittarius" isEqualToString:zodiac_sign(240)]);
    XCTAssertTrue([@"Sagittarius" isEqualToString:zodiac_sign(255)]);
    XCTAssertTrue([@"Sagittarius" isEqualToString:zodiac_sign(269.9)]);
    XCTAssertTrue([@"Capricorn" isEqualToString:zodiac_sign(270)]);
    XCTAssertTrue([@"Capricorn" isEqualToString:zodiac_sign(285)]);
    XCTAssertTrue([@"Capricorn" isEqualToString:zodiac_sign(299.9)]);
    XCTAssertTrue([@"Aquarius" isEqualToString:zodiac_sign(300)]);
    XCTAssertTrue([@"Aquarius" isEqualToString:zodiac_sign(315)]);
    XCTAssertTrue([@"Aquarius" isEqualToString:zodiac_sign(329.9)]);
    XCTAssertTrue([@"Pisces" isEqualToString:zodiac_sign(330)]);
    XCTAssertTrue([@"Pisces" isEqualToString:zodiac_sign(345)]);
    XCTAssertTrue([@"Pisces" isEqualToString:zodiac_sign(359.9)]);
}


- (void)testZodiacShortName
{
    XCTAssertTrue([@"AR" isEqualToString:zodiac_sign_short(0)]);
    XCTAssertTrue([@"AR" isEqualToString:zodiac_sign_short(15)]);
    XCTAssertTrue([@"AR" isEqualToString:zodiac_sign_short(29.9)]);
    XCTAssertTrue([@"TA" isEqualToString:zodiac_sign_short(30)]);
    XCTAssertTrue([@"TA" isEqualToString:zodiac_sign_short(45)]);
    XCTAssertTrue([@"TA" isEqualToString:zodiac_sign_short(59.9)]);
    XCTAssertTrue([@"GE" isEqualToString:zodiac_sign_short(60)]);
    XCTAssertTrue([@"GE" isEqualToString:zodiac_sign_short(75)]);
    XCTAssertTrue([@"GE" isEqualToString:zodiac_sign_short(89.9)]);
    XCTAssertTrue([@"CN" isEqualToString:zodiac_sign_short(90)]);
    XCTAssertTrue([@"CN" isEqualToString:zodiac_sign_short(105)]);
    XCTAssertTrue([@"CN" isEqualToString:zodiac_sign_short(119.9)]);
    XCTAssertTrue([@"LE" isEqualToString:zodiac_sign_short(120)]);
    XCTAssertTrue([@"LE" isEqualToString:zodiac_sign_short(135)]);
    XCTAssertTrue([@"LE" isEqualToString:zodiac_sign_short(149.9)]);
    XCTAssertTrue([@"VI" isEqualToString:zodiac_sign_short(150)]);
    XCTAssertTrue([@"VI" isEqualToString:zodiac_sign_short(165)]);
    XCTAssertTrue([@"VI" isEqualToString:zodiac_sign_short(179.9)]);
    XCTAssertTrue([@"LI" isEqualToString:zodiac_sign_short(180)]);
    XCTAssertTrue([@"LI" isEqualToString:zodiac_sign_short(195)]);
    XCTAssertTrue([@"LI" isEqualToString:zodiac_sign_short(209.9)]);
    XCTAssertTrue([@"SC" isEqualToString:zodiac_sign_short(210)]);
    XCTAssertTrue([@"SC" isEqualToString:zodiac_sign_short(225)]);
    XCTAssertTrue([@"SC" isEqualToString:zodiac_sign_short(239.9)]);
    XCTAssertTrue([@"SG" isEqualToString:zodiac_sign_short(240)]);
    XCTAssertTrue([@"SG" isEqualToString:zodiac_sign_short(255)]);
    XCTAssertTrue([@"SG" isEqualToString:zodiac_sign_short(269.9)]);
    XCTAssertTrue([@"CP" isEqualToString:zodiac_sign_short(270)]);
    XCTAssertTrue([@"CP" isEqualToString:zodiac_sign_short(285)]);
    XCTAssertTrue([@"CP" isEqualToString:zodiac_sign_short(299.9)]);
    XCTAssertTrue([@"AQ" isEqualToString:zodiac_sign_short(300)]);
    XCTAssertTrue([@"AQ" isEqualToString:zodiac_sign_short(315)]);
    XCTAssertTrue([@"AQ" isEqualToString:zodiac_sign_short(329.9)]);
    XCTAssertTrue([@"PI" isEqualToString:zodiac_sign_short(330)]);
    XCTAssertTrue([@"PI" isEqualToString:zodiac_sign_short(345)]);
    XCTAssertTrue([@"PI" isEqualToString:zodiac_sign_short(359.9)]);
}


@end
