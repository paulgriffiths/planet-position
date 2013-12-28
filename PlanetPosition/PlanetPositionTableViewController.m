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
#import "PGPlanetDetails.h"


@interface PlanetPositionTableViewController ()

@end


@implementation PlanetPositionTableViewController {
    PlanetPositionPlanetsGroup * _planetsGroup;
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
        long row = [[self.tableView indexPathForSelectedRow] row];
        controller.planet = [_planetsGroup planetAtIndex:row];
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
    PlanetPositionPlanetListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                                                  forIndexPath:indexPath];
    
    // Configure the cell...
    
    long row = [indexPath row];
    PGPlanetDetails * planetDetails = [PGPlanetDetails objectWithPlanet:[_planetsGroup planetAtIndex:row]];
    cell.planetLabel.text = planetDetails.name;
    cell.coordsLabel.text = planetDetails.zodCoords;
    cell.planetImage.image = planetDetails.imageSmall;
    
    return cell;
}


@end
