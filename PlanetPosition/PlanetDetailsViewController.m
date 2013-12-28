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

@implementation PlanetDetailsViewController


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

    PGPlanetDetails * planetDetails = [PGPlanetDetails objectWithPlanet:self.planet];
    
    self.planetNameLabel.text = planetDetails.name;
    self.planetImage.image = planetDetails.imageLarge;
    
    self.rightAscensionLabel.text = planetDetails.rascString;
    self.declinationLabel.text = planetDetails.declString;
    self.distanceLabel.text = planetDetails.distString;
    
    self.zodiacSignLabel.text = planetDetails.zodSignName;
    self.zodiacDecanLabel.text = planetDetails.zodDecan;
    self.zodiacCoordsLabel.text = planetDetails.zodCoords;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
