//
//  TestPlanetGroup.m
//  planet-pos
//
//  Created by Paul Griffiths on 12/29/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PlanetPositionPlanetsGroup.h"
#import "PGRAstro.h"

@interface TestPlanetGroup : XCTestCase

@end

@implementation TestPlanetGroup

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


//  Test that a planet group contains the right number of planets of the right type.

- (void)testPlanetGroup
{
    PlanetPositionPlanetsGroup * planetGroup = [PlanetPositionPlanetsGroup new];
    NSArray * planetClassArray = @[[PGAstroMoon class], [PGAstroMercury class], [PGAstroVenus class],
                                   [PGAstroSun class], [PGAstroMars class], [PGAstroJupiter class],
                                   [PGAstroSaturn class], [PGAstroUranus class], [PGAstroNeptune class],
                                   [PGAstroPluto class]];
    
    NSUInteger numPlanets = [planetGroup numPlanets];
    XCTAssertEqual(numPlanets, 10U);
    
    for ( NSUInteger i = 0; i < numPlanets; ++i ) {
        XCTAssertTrue([[planetGroup planetAtIndex:i] isMemberOfClass:planetClassArray[i++]]);
    }
}

@end
