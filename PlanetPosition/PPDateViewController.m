//
//  PPDateViewController.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//


#import "PPDateViewController.h"
#import "PGAstro.h"
#import "PGRDateHelpers.h"
#import "AstroDateGroup.h"


@interface PPDateViewController ()

@end


@implementation PPDateViewController {
    NSTimer * _timer;
}


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
    [self updateData];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateData];
    _timer = [NSTimer scheduledTimerWithTimeInterval:60.0f target:self
                                            selector:@selector(updateData) userInfo:nil repeats:YES];
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
}


- (void)updateData {
    AstroDateGroup * dateGroup = [AstroDateGroup new];
    self.dateLabel.text = dateGroup.dateStringUTC;
    [self.dateLabel sizeToFit];
    self.julianDayLabel.text = dateGroup.dateStringJulian;
    [self.julianDayLabel sizeToFit];
    self.thelemicDateLabel.text = dateGroup.dateStringThelemic;
    [self.thelemicDateLabel sizeToFit];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
