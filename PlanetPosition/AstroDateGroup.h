//
//  AstroDateGroup.h
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AstroDateGroup : NSObject

@property (strong, nonatomic, readonly) NSString * dateStringUTC;
@property (strong, nonatomic, readonly) NSString * dateStringJulian;
@property (strong, nonatomic, readonly) NSString * dateStringThelemic;

+ (AstroDateGroup *)objectWithDate:(NSDate *)date;
- (instancetype)initWithDate:(NSDate *)date;
- (void)updateDataWithDate:(NSDate *)date;
- (void)updateData;


@end
