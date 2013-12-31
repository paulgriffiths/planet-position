//
//  PlanetDetailsViewController.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PlanetDetailsViewController.h"
#import "PGPlanetDetails.h"


@interface PlanetDetailsViewController ()

@end

@implementation PlanetDetailsViewController {
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
    
    self.navigationItem.title = self.planet.name;

    [self updateData];
}


- (void)updateData {
    PGPlanetDetails * planetDetails = [PGPlanetDetails objectWithPlanet:self.planet];

    self.planetNameLabel.text = planetDetails.name;
    [self.planetNameLabel sizeToFit];
    self.planetImage.image = planetDetails.imageLarge;
    
    self.rightAscensionLabel.text = planetDetails.rascString;
    [self.rightAscensionLabel sizeToFit];
    self.declinationLabel.text = planetDetails.declString;
    [self.declinationLabel sizeToFit];
    self.distanceLabel.text = planetDetails.distString;
    [self.distanceLabel sizeToFit];
    
    self.zodiacSignLabel.text = planetDetails.zodSignName;
    [self.zodiacSignLabel sizeToFit];
    self.zodiacDecanLabel.text = planetDetails.zodDecan;
    [self.zodiacDecanLabel sizeToFit];
    self.zodiacCoordsLabel.text = planetDetails.zodCoords;
    [self.zodiacCoordsLabel sizeToFit];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshOnTimer];
    _timer = [NSTimer scheduledTimerWithTimeInterval:60.0f target:self
                                            selector:@selector(refreshOnTimer) userInfo:nil repeats:YES];
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
}


-(void)refreshOnTimer {
    self.planet = [self.planet clone];
    [self updateData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
