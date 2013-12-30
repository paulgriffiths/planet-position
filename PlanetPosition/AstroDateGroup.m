//
//  AstroDateGroup.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "AstroDateGroup.h"
#import "PGRAstro.h"

@implementation AstroDateGroup


+ (AstroDateGroup *)objectWithDate:(NSDate *)date {
    return [[AstroDateGroup alloc] initWithDate:date];
}

- (instancetype)initWithDate:(NSDate *)date {
    if ( (self = [super init]) ) {
        [self updateDataWithDate:date];
    }
    return self;
}


- (instancetype)init {
    return [self initWithDate:[NSDate date]];
}


- (void)updateData {
    [self updateDataWithDate:[NSDate date]];
}


- (void)updateDataWithDate:(NSDate *)date {
    
    //  Compute and store the UTC date string
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    _dateStringUTC = [dateFormatter stringFromDate:date];
    
    //  Compute and store the Julian day string
    
    NSNumberFormatter * nf = [NSNumberFormatter new];
    nf.numberStyle = NSNumberFormatterDecimalStyle;
    [nf setMaximumFractionDigits:2];
    NSNumber * julianDay = [NSNumber numberWithDouble:PGRAstroJulianDay(date)];
    _dateStringJulian = [NSString stringWithFormat:@"%@", [nf stringFromNumber:julianDay]];
    
    //  Computer and store the Thelemic date string
    
    PGRAstroZodiacInfo * zInfo = [PGRAstroZodiacInfo objectWithRasc:[PGRAstroSun planetWithDate:date].rightAscension];
    _dateStringThelemic = [NSString stringWithFormat:@"Sol in %i%@ %@, Anno %@", zInfo.zodiacDMS.degrees, @"\u00B0", zInfo.signShortName, PGRAstroGetThelemicYear(date)];
}


@end
