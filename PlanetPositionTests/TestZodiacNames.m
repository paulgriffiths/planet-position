//
//  TestZodiacNames.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/24/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGRAstroGeneral.h"

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
    XCTAssertTrue([@"Aries" isEqualToString:PGRAstroZodiacSign(0)]);
    XCTAssertTrue([@"Aries" isEqualToString:PGRAstroZodiacSign(15)]);
    XCTAssertTrue([@"Aries" isEqualToString:PGRAstroZodiacSign(29.9)]);
    XCTAssertTrue([@"Taurus" isEqualToString:PGRAstroZodiacSign(30)]);
    XCTAssertTrue([@"Taurus" isEqualToString:PGRAstroZodiacSign(45)]);
    XCTAssertTrue([@"Taurus" isEqualToString:PGRAstroZodiacSign(59.9)]);
    XCTAssertTrue([@"Gemini" isEqualToString:PGRAstroZodiacSign(60)]);
    XCTAssertTrue([@"Gemini" isEqualToString:PGRAstroZodiacSign(75)]);
    XCTAssertTrue([@"Gemini" isEqualToString:PGRAstroZodiacSign(89.9)]);
    XCTAssertTrue([@"Cancer" isEqualToString:PGRAstroZodiacSign(90)]);
    XCTAssertTrue([@"Cancer" isEqualToString:PGRAstroZodiacSign(105)]);
    XCTAssertTrue([@"Cancer" isEqualToString:PGRAstroZodiacSign(119.9)]);
    XCTAssertTrue([@"Leo" isEqualToString:PGRAstroZodiacSign(120)]);
    XCTAssertTrue([@"Leo" isEqualToString:PGRAstroZodiacSign(135)]);
    XCTAssertTrue([@"Leo" isEqualToString:PGRAstroZodiacSign(149.9)]);
    XCTAssertTrue([@"Virgo" isEqualToString:PGRAstroZodiacSign(150)]);
    XCTAssertTrue([@"Virgo" isEqualToString:PGRAstroZodiacSign(165)]);
    XCTAssertTrue([@"Virgo" isEqualToString:PGRAstroZodiacSign(179.9)]);
    XCTAssertTrue([@"Libra" isEqualToString:PGRAstroZodiacSign(180)]);
    XCTAssertTrue([@"Libra" isEqualToString:PGRAstroZodiacSign(195)]);
    XCTAssertTrue([@"Libra" isEqualToString:PGRAstroZodiacSign(209.9)]);
    XCTAssertTrue([@"Scorpio" isEqualToString:PGRAstroZodiacSign(210)]);
    XCTAssertTrue([@"Scorpio" isEqualToString:PGRAstroZodiacSign(225)]);
    XCTAssertTrue([@"Scorpio" isEqualToString:PGRAstroZodiacSign(239.9)]);
    XCTAssertTrue([@"Sagittarius" isEqualToString:PGRAstroZodiacSign(240)]);
    XCTAssertTrue([@"Sagittarius" isEqualToString:PGRAstroZodiacSign(255)]);
    XCTAssertTrue([@"Sagittarius" isEqualToString:PGRAstroZodiacSign(269.9)]);
    XCTAssertTrue([@"Capricorn" isEqualToString:PGRAstroZodiacSign(270)]);
    XCTAssertTrue([@"Capricorn" isEqualToString:PGRAstroZodiacSign(285)]);
    XCTAssertTrue([@"Capricorn" isEqualToString:PGRAstroZodiacSign(299.9)]);
    XCTAssertTrue([@"Aquarius" isEqualToString:PGRAstroZodiacSign(300)]);
    XCTAssertTrue([@"Aquarius" isEqualToString:PGRAstroZodiacSign(315)]);
    XCTAssertTrue([@"Aquarius" isEqualToString:PGRAstroZodiacSign(329.9)]);
    XCTAssertTrue([@"Pisces" isEqualToString:PGRAstroZodiacSign(330)]);
    XCTAssertTrue([@"Pisces" isEqualToString:PGRAstroZodiacSign(345)]);
    XCTAssertTrue([@"Pisces" isEqualToString:PGRAstroZodiacSign(359.9)]);
}


- (void)testZodiacShortName
{
    XCTAssertTrue([@"AR" isEqualToString:PGRAstroZodiacSignShort(0)]);
    XCTAssertTrue([@"AR" isEqualToString:PGRAstroZodiacSignShort(15)]);
    XCTAssertTrue([@"AR" isEqualToString:PGRAstroZodiacSignShort(29.9)]);
    XCTAssertTrue([@"TA" isEqualToString:PGRAstroZodiacSignShort(30)]);
    XCTAssertTrue([@"TA" isEqualToString:PGRAstroZodiacSignShort(45)]);
    XCTAssertTrue([@"TA" isEqualToString:PGRAstroZodiacSignShort(59.9)]);
    XCTAssertTrue([@"GE" isEqualToString:PGRAstroZodiacSignShort(60)]);
    XCTAssertTrue([@"GE" isEqualToString:PGRAstroZodiacSignShort(75)]);
    XCTAssertTrue([@"GE" isEqualToString:PGRAstroZodiacSignShort(89.9)]);
    XCTAssertTrue([@"CN" isEqualToString:PGRAstroZodiacSignShort(90)]);
    XCTAssertTrue([@"CN" isEqualToString:PGRAstroZodiacSignShort(105)]);
    XCTAssertTrue([@"CN" isEqualToString:PGRAstroZodiacSignShort(119.9)]);
    XCTAssertTrue([@"LE" isEqualToString:PGRAstroZodiacSignShort(120)]);
    XCTAssertTrue([@"LE" isEqualToString:PGRAstroZodiacSignShort(135)]);
    XCTAssertTrue([@"LE" isEqualToString:PGRAstroZodiacSignShort(149.9)]);
    XCTAssertTrue([@"VI" isEqualToString:PGRAstroZodiacSignShort(150)]);
    XCTAssertTrue([@"VI" isEqualToString:PGRAstroZodiacSignShort(165)]);
    XCTAssertTrue([@"VI" isEqualToString:PGRAstroZodiacSignShort(179.9)]);
    XCTAssertTrue([@"LI" isEqualToString:PGRAstroZodiacSignShort(180)]);
    XCTAssertTrue([@"LI" isEqualToString:PGRAstroZodiacSignShort(195)]);
    XCTAssertTrue([@"LI" isEqualToString:PGRAstroZodiacSignShort(209.9)]);
    XCTAssertTrue([@"SC" isEqualToString:PGRAstroZodiacSignShort(210)]);
    XCTAssertTrue([@"SC" isEqualToString:PGRAstroZodiacSignShort(225)]);
    XCTAssertTrue([@"SC" isEqualToString:PGRAstroZodiacSignShort(239.9)]);
    XCTAssertTrue([@"SG" isEqualToString:PGRAstroZodiacSignShort(240)]);
    XCTAssertTrue([@"SG" isEqualToString:PGRAstroZodiacSignShort(255)]);
    XCTAssertTrue([@"SG" isEqualToString:PGRAstroZodiacSignShort(269.9)]);
    XCTAssertTrue([@"CP" isEqualToString:PGRAstroZodiacSignShort(270)]);
    XCTAssertTrue([@"CP" isEqualToString:PGRAstroZodiacSignShort(285)]);
    XCTAssertTrue([@"CP" isEqualToString:PGRAstroZodiacSignShort(299.9)]);
    XCTAssertTrue([@"AQ" isEqualToString:PGRAstroZodiacSignShort(300)]);
    XCTAssertTrue([@"AQ" isEqualToString:PGRAstroZodiacSignShort(315)]);
    XCTAssertTrue([@"AQ" isEqualToString:PGRAstroZodiacSignShort(329.9)]);
    XCTAssertTrue([@"PI" isEqualToString:PGRAstroZodiacSignShort(330)]);
    XCTAssertTrue([@"PI" isEqualToString:PGRAstroZodiacSignShort(345)]);
    XCTAssertTrue([@"PI" isEqualToString:PGRAstroZodiacSignShort(359.9)]);
}


@end
