//
//  PlanetPositionTableViewController.m
//  PlanetPosition
//
//  Created by Paul Griffiths on 12/26/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PlanetPositionTableViewController.h"
#import "PlanetPositionPlanetsGroup.h"
#import "PlanetPositionPlanetListTableViewCell.h"
#import "PGAstro.h"
#import "PlanetDetailsViewController.h"

@interface PlanetPositionTableViewController () {
    PlanetPositionPlanetsGroup * _planetsGroup;
}

@end

@implementation PlanetPositionTableViewController

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

    _planetsGroup = [PlanetPositionPlanetsGroup new];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [[segue identifier] isEqualToString:@"planetDetailsSegue"] ) {
        PlanetDetailsViewController * controller = [segue destinationViewController];
        NSIndexPath * idxPath = [self.tableView indexPathForSelectedRow];
        long row = [idxPath row];
        PGAstroPlanet * planet = [_planetsGroup planetAtIndex:row];
        controller.planet = planet;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_planetsGroup numPlanets];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"planetListTableCell";
    PlanetPositionPlanetListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    long row = [indexPath row];
    PGAstroPlanet * planet = [_planetsGroup planetAtIndex:row];
    
    cell.planetLabel.text = [planet name];
    cell.coordsLabel.text = rasc_to_zodiac([planet rightAscension]);
    cell.planetImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_thumb", [planet name]]];
    
    return cell;
}


@end
