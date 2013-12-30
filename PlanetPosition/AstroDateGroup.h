//
//  AstroDateGroup.h
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 A class to hold various representations of a date.
 */
@interface AstroDateGroup : NSObject

/**
 A string representation of the UTC date.
 */
@property (strong, nonatomic, readonly) NSString * dateStringUTC;

/**
 A string representation of the Julian day.
 */
@property (strong, nonatomic, readonly) NSString * dateStringJulian;

/**
 A string representation of the Thelemic date.
 */
@property (strong, nonatomic, readonly) NSString * dateStringThelemic;

/**
 Returns an object created with a specified date.
 @param date The date for which to create the object.
 @return An object created with the specified date.
 */
+ (AstroDateGroup *)objectWithDate:(NSDate *)date;

/**
 Returns an object created with a specified date.
 @param date The date for which to create the object.
 @return An object created with the specified date.
 */
- (instancetype)initWithDate:(NSDate *)date;

/**
 Updates the object with a provided date.
 @param date The date to which to update the object.
 */
- (void)updateDataWithDate:(NSDate *)date;

/**
 Updates the object with the current date.
 */
- (void)updateData;


@end
