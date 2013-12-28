//
//  PlanetPositionPlanetListTableViewCell.h
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/26/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlanetPositionPlanetListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *planetImage;
@property (strong, nonatomic) IBOutlet UILabel *planetLabel;
@property (strong, nonatomic) IBOutlet UILabel *coordsLabel;

@end
