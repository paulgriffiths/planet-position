//
//  PlanetDetailsViewController.h
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PGAstro.h"

@interface PlanetDetailsViewController : UITableViewController

@property (strong, nonatomic) PGAstroPlanet * planet;

@property (strong, nonatomic) IBOutlet UIImageView *planetImage;
@property (strong, nonatomic) IBOutlet UILabel *planetNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightAscensionLabel;
@property (strong, nonatomic) IBOutlet UILabel *declinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *zodiacSignLabel;
@property (strong, nonatomic) IBOutlet UILabel *zodiacCoordsLabel;
@property (strong, nonatomic) IBOutlet UILabel *zodiacDecanLabel;



@end
