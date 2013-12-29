//
//  TestPlanetDetails.m
//  planet-pos
//
//  Created by Paul Griffiths on 12/28/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGPlanetDetails.h"
#import "PGDateHelpers.h"
#import "PGAstro.h"

@interface TestPlanetDetails : XCTestCase

@end

@implementation TestPlanetDetails

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

- (void)testPlanetDetails
{
    NSDate * testDate = getUTCDate(2013, 12, 29, 1, 53, 0);
    PGAstroMoon * moon = [PGAstroMoon planetWithDate:testDate];
    PGPlanetDetails * planetDetails = [PGPlanetDetails objectWithPlanet:moon];
    
    XCTAssertTrue([planetDetails.name isEqualToString:@"Moon"]);
    XCTAssertTrue([planetDetails.rascString isEqualToString:@"15h 14m 38s"]);
    XCTAssertTrue([planetDetails.declString isEqualToString:@"-16\u00B0 41m 09s"]);
    XCTAssertTrue([planetDetails.distString isEqualToString:@"57.917 Earth Radii"]);
    XCTAssertTrue([planetDetails.zodSignName isEqualToString:@"Scorpio"]);
    XCTAssertTrue([planetDetails.zodDecan isEqualToString:@"Succedent"]);
    XCTAssertTrue([planetDetails.zodCoords isEqualToString:@"18SC39"]);
}

@end
