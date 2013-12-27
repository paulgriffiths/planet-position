//
//  PPDateViewController.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PPDateViewController.h"
#import "PGAstro.h"

@interface PPDateViewController ()

@end

@implementation PPDateViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSDate * currentDate = [NSDate new];
    
    NSDateComponents * cDC = get_utc_components_from_date(currentDate);
    
    NSString * dateString = [NSString stringWithFormat:@"%i/%i/%i %i:%i:%i", [cDC year], [cDC month], [cDC day],
                             [cDC hour], [cDC minute], [cDC second]];
    self.dateLabel.text = dateString;
    
    NSNumberFormatter * nf = [NSNumberFormatter new];
    nf.numberStyle = NSNumberFormatterDecimalStyle;
    [nf setMaximumFractionDigits:2];
    NSNumber * julianDay = [NSNumber numberWithDouble:julian_day(currentDate)];
    self.julianDayLabel.text = [NSString stringWithFormat:@"%@", [nf stringFromNumber:julianDay]];
    
    PGAstroSun * sun = [PGAstroSun new];
    PGAstroZodiacInfo * zInfo = get_zodiac_info([sun rightAscension]);
    self.thelemicDateLabel.text = [NSString stringWithFormat:@"Sol in %i%@ %@, Anno %@", zInfo.zodiacDMS.degrees, @"\u00B0", zInfo.signShortName, get_thelemic_year(currentDate)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
