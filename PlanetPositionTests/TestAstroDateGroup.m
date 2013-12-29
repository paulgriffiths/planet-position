//
//  TestAstroDateGroup.m
//  planet-pos
//
//  Created by Paul Griffiths on 12/28/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AstroDateGroup.h"
#import "PGDateHelpers.h"


@interface TestAstroDateGroup : XCTestCase

@end

@implementation TestAstroDateGroup

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

- (void)testAstroDateGroup
{
    NSDate * testDate = getUTCDate(2013, 12, 29, 2, 4, 0);
    AstroDateGroup * dateGroup = [AstroDateGroup objectWithDate:testDate];
    
    XCTAssertTrue([dateGroup.dateStringUTC isEqualToString:@"Dec 29, 2013, 2:04 AM"]);
    XCTAssertTrue([dateGroup.dateStringJulian isEqualToString:@"2,456,655.59"]);
    XCTAssertTrue([dateGroup.dateStringThelemic isEqualToString:@"Sol in 7\u00B0 CP, Anno IV:21"]);
}

@end
