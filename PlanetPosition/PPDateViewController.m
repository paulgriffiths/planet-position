//
//  PPDateViewController.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//


#import "PPDateViewController.h"
#import "PGAstro.h"
#import "PGDateHelpers.h"
#import "AstroDateGroup.h"


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
    
    AstroDateGroup * dateGroup = [AstroDateGroup new];
    self.dateLabel.text = dateGroup.dateStringUTC;
    self.julianDayLabel.text = dateGroup.dateStringJulian;
    self.thelemicDateLabel.text = dateGroup.dateStringThelemic;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
