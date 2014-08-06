//
//  PLMyPartiesViewController.m
//  LuckyPotluck
//
//  Created by Yen-Han Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLMyPartiesViewController.h"
#import "Potluck.h"
#import "Attendee.h"
#import "PLPartyCell.h"
#import "PLPartyDetailCell.h"
#import "PLMyPartyDetailViewController.h"

@interface PLMyPartiesViewController ()

@property NSArray* partyArr;
@property Potluck* selectedParty;


@end

@implementation PLMyPartiesViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    
}


#pragma mark Tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_partyArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"partyCell";
    PLPartyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Potluck *party = [_partyArr objectAtIndex:indexPath.row];
    
/*  set up party image in the future
 
    NSURL *url;
    if (party.image != nil)
        url = [[NSURL alloc] initWithString:party.image];
    
    [cell.partyimage setImageWithURL:[NSURL URLWithString:party.image]];
    cell.partyimage = [LHUtility roundCornerImage:cell.partyimage];
 */
 
    cell.partyNameLabel.text = party.name;
    
    return cell;
}

#pragma mark Tableview Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedParty=[_partyArr objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"partyDetail" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"partyDetail"]) {
        PLMyPartyDetailViewController *detailVC = segue.destinationViewController;
        detailVC.selectedParty = _selectedParty;
    }
}


@end
