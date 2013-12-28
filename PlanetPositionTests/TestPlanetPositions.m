//
//  TestPlanetPositions.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/26/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//
//  Test cases were taken from:
//
//    http://ssd.jpl.nasa.gov/?horizons
//
//  on August 4, 2013.


#import <XCTest/XCTest.h>
#import "PGAstro.h"
#import "PGDateHelpers.h"

@interface TestPlanetPositions : XCTestCase

@end

@implementation TestPlanetPositions

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

- (void)testSun
{
    NSDate * testDate = getUTCDate(2013, 6, 4, 1, 15, 0);
    PGAstroSun * sun = [[PGAstroSun alloc] initWithDate:testDate];
    const double ra_accuracy = 0.01;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.0001;
    
    double expected_result = 72.0135416666667;
    XCTAssertEqualWithAccuracy([sun rightAscension], expected_result, ra_accuracy);

    expected_result = 22.4078888888889;
    XCTAssertEqualWithAccuracy([sun declination], expected_result, de_accuracy);

    expected_result = 1.01447036664534;
    XCTAssertEqualWithAccuracy([sun distance], expected_result, di_accuracy);
}


- (void)testMercury
{
    NSDate * testDate = getUTCDate(1980, 5, 5, 20, 23, 0);
    PGAstroMercury * mercury = [[PGAstroMercury alloc] initWithDate:testDate];
    const double ra_accuracy = 0.1;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.0001;
    
    double expected_result = 35.0765;
    XCTAssertEqualWithAccuracy([mercury rightAscension], expected_result, ra_accuracy);
    
    expected_result = 12.7926666666667;
    XCTAssertEqualWithAccuracy([mercury declination], expected_result, de_accuracy);
    
    expected_result = 1.30377991344909;
    XCTAssertEqualWithAccuracy([mercury distance], expected_result, di_accuracy);
}


- (void)testVenus
{
    NSDate * testDate = getUTCDate(1982, 6, 14, 8, 30, 0);
    PGAstroVenus * venus = [[PGAstroVenus alloc] initWithDate:testDate];
    const double ra_accuracy = 0.01;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.001;
    
    double expected_result = 45.2389583333333;
    XCTAssertEqualWithAccuracy([venus rightAscension], expected_result, ra_accuracy);
    
    expected_result = 15.0340277777778;
    XCTAssertEqualWithAccuracy([venus declination], expected_result, de_accuracy);
    
    expected_result = 1.23214680691694;
    XCTAssertEqualWithAccuracy([venus distance], expected_result, di_accuracy);
}


- (void)testMars
{
    NSDate * testDate = getUTCDate(1997, 6, 21, 0, 0, 0);
    PGAstroMars * mars = [[PGAstroMars alloc] initWithDate:testDate];
    const double ra_accuracy = 0.01;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.0001;
    
    double expected_result = 180.840541666667;
    XCTAssertEqualWithAccuracy(normalizeDegrees([mars rightAscension]), expected_result, ra_accuracy);
    
    expected_result = 0.03566666666667;
    XCTAssertEqualWithAccuracy([mars declination], expected_result, de_accuracy);
    
    expected_result = 1.18174124286972;
    XCTAssertEqualWithAccuracy([mars distance], expected_result, di_accuracy);
}


- (void)testJupiter
{
    NSDate * testDate = getUTCDate(1991, 6, 17, 0, 0, 0);
    PGAstroJupiter * jupiter = [[PGAstroJupiter alloc] initWithDate:testDate];
    const double ra_accuracy = 0.01;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.01;
    
    double expected_result = 134.511875;
    XCTAssertEqualWithAccuracy([jupiter rightAscension], expected_result, ra_accuracy);
    
    expected_result = 17.9471666666667;
    XCTAssertEqualWithAccuracy([jupiter declination], expected_result, de_accuracy);
    
    expected_result = 5.9852047799159;
    XCTAssertEqualWithAccuracy([jupiter distance], expected_result, di_accuracy);
}


- (void)testSaturn
{
    NSDate * testDate = getUTCDate(1947, 12, 1, 12, 0, 0);
    PGAstroSaturn * saturn = [[PGAstroSaturn alloc] initWithDate:testDate];
    const double ra_accuracy = 0.02;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.01;
    
    double expected_result = 146.079125;
    XCTAssertEqualWithAccuracy([saturn rightAscension], expected_result, ra_accuracy);
    
    expected_result = 14.6949444444444;
    XCTAssertEqualWithAccuracy([saturn declination], expected_result, de_accuracy);
    
    expected_result = 8.84280824210253;
    XCTAssertEqualWithAccuracy([saturn distance], expected_result, di_accuracy);
}


- (void)testUranus
{
    NSDate * testDate = getUTCDate(1975, 10, 31, 8, 0, 0);
    PGAstroUranus * uranus = [[PGAstroUranus alloc] initWithDate:testDate];
    const double ra_accuracy = 0.02;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.01;
    
    double expected_result = 211.38025;
    XCTAssertEqualWithAccuracy(normalizeDegrees([uranus rightAscension]), expected_result, ra_accuracy);
    
    expected_result = -12.21186111111110;
    XCTAssertEqualWithAccuracy([uranus declination], expected_result, de_accuracy);
    
    expected_result = 19.4873488102392;
    XCTAssertEqualWithAccuracy([uranus distance], expected_result, di_accuracy);
}


- (void)testNeptune
{
    NSDate * testDate = getUTCDate(1966, 9, 15, 9, 0, 0);
    PGAstroNeptune * neptune = [[PGAstroNeptune alloc] initWithDate:testDate];
    const double ra_accuracy = 0.01;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.01;
    
    double expected_result = 228.44925;
    XCTAssertEqualWithAccuracy(normalizeDegrees([neptune rightAscension]), expected_result, ra_accuracy);
    
    expected_result = -16.2009444444444;
    XCTAssertEqualWithAccuracy([neptune declination], expected_result, de_accuracy);
    
    expected_result = 30.8457020366069;
    XCTAssertEqualWithAccuracy([neptune distance], expected_result, di_accuracy);
}


- (void)testPluto
{
    NSDate * testDate = getUTCDate(2001, 9, 11, 14, 0, 0);
    PGAstroPluto * pluto = [[PGAstroPluto alloc] initWithDate:testDate];
    const double ra_accuracy = 0.01;
    const double de_accuracy = 0.01;
    const double di_accuracy = 0.01;
    
    double expected_result = 252.494583333333;
    XCTAssertEqualWithAccuracy(normalizeDegrees([pluto rightAscension]), expected_result, ra_accuracy);
    
    expected_result = -12.1994722222222;
    XCTAssertEqualWithAccuracy([pluto declination], expected_result, de_accuracy);
    
    expected_result = 30.5130260187628;
    XCTAssertEqualWithAccuracy([pluto distance], expected_result, di_accuracy);
}


- (void)testMoon
{
    NSDate * testDate = getUTCDate(1988, 8, 10, 0, 0, 0);
    PGAstroMoon * moon = [[PGAstroMoon alloc] initWithDate:testDate];
    const double ra_accuracy = 0.3;
    const double de_accuracy = 0.1;
    
    double expected_result = 112.130708333333;
    XCTAssertEqualWithAccuracy([moon rightAscension], expected_result, ra_accuracy);
    
    expected_result = 26.1949444444444;
    XCTAssertEqualWithAccuracy([moon declination], expected_result, de_accuracy);
}


@end
