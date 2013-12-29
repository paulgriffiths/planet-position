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
#import "PGRAstro.h"
#import "PlanetDetailsViewController.h"
#import "PGPlanetDetails.h"


@interface PlanetPositionTableViewController ()

@end


@implementation PlanetPositionTableViewController {
    PlanetPositionPlanetsGroup * _planetsGroup;
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
    
    _planetsGroup = [PlanetPositionPlanetsGroup new];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [[segue identifier] isEqualToString:@"planetDetailsSegue"] ) {
        [_planetsGroup update];
        PlanetDetailsViewController * controller = [segue destinationViewController];
        long row = [[self.tableView indexPathForSelectedRow] row];
        controller.planet = [_planetsGroup planetAtIndex:row];
    }
    
    (void)sender;       //  Avoid unused parameter warning
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
    [_planetsGroup update];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    (void)tableView;        //  Avoid unused parameter warning
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.

    (void)tableView;        //  Avoid unused parameter warning
    (void)section;          //  Avoid unused parameter warning
    
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
