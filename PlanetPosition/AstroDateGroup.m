//
//  AstroDateGroup.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "AstroDateGroup.h"
#import "PGAstro.h"

@implementation AstroDateGroup


+ (AstroDateGroup *)objectWithDate:(NSDate *)date {
    return [[AstroDateGroup alloc] initWithDate:date];
}

- (AstroDateGroup *)initWithDate:(NSDate *)date {
    if ( (self = [super init]) ) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        _dateStringUTC = [dateFormatter stringFromDate:date];
        
        NSNumberFormatter * nf = [NSNumberFormatter new];
        nf.numberStyle = NSNumberFormatterDecimalStyle;
        [nf setMaximumFractionDigits:2];
        NSNumber * julianDay = [NSNumber numberWithDouble:julian_day(date)];
        _dateStringJulian = [NSString stringWithFormat:@"%@", [nf stringFromNumber:julianDay]];
        
        PGAstroZodiacInfo * zInfo = [PGAstroZodiacInfo objectWithRasc:[PGAstroSun new].rightAscension];
        _dateStringThelemic = [NSString stringWithFormat:@"Sol in %i%@ %@, Anno %@", zInfo.zodiacDMS.degrees, @"\u00B0", zInfo.signShortName, get_thelemic_year(date)];
    }
    return self;
}

- (AstroDateGroup *)init {
    return [self initWithDate:[NSDate date]];
}


@end
