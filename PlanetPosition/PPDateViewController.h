//
//  PPDateViewController.h
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/27/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPDateViewController : UITableViewController


@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *julianDayLabel;
@property (strong, nonatomic) IBOutlet UILabel *thelemicDateLabel;

@end
