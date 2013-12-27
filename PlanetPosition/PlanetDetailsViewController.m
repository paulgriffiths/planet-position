//
//  PlanetDetailsViewController.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PlanetDetailsViewController.h"

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.planetImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_large", [self.planet name]]];
    self.planetNameLabel.text = [self.planet name];
    
    PGAstroZodiacInfo * zInfo = get_zodiac_info([self.planet rightAscension]);
    
    self.rightAscensionLabel.text = rasc_string([self.planet rightAscension]);
    self.declinationLabel.text = decl_string([self.planet declination]);
    self.distanceLabel.text = @"Placeholder";
    
    self.zodiacSignLabel.text = zInfo.signName;
    NSString * decan;
    if ( zInfo.zodiacDMS.degrees < 10 ) {
        decan = @"Ascendant";
    } else if ( zInfo.zodiacDMS.degrees < 20 ) {
        decan = @"Succedent";
    } else {
        decan = @"Cadent";
    }
    self.zodiacDecanLabel.text = decan;
    self.zodiacCoordsLabel.text = rasc_to_zodiac(zInfo.rightAscension);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
