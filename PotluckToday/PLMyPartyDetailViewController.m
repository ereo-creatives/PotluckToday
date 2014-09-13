//
//  PLMyPartyDetailViewController.m
//  PotluckToday
//
//  Created by Ryan Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLMyPartyDetailViewController.h"
#import "PLPartyDetailCell.h"
#import "PLPartyDetailCell.h"

@interface PLMyPartyDetailViewController ()

@property NSArray* attendeeArr;

@end

@implementation PLMyPartyDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark Tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_attendeeArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"partyDetailCell";
    PLPartyDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Attendee *attendee = [_attendeeArr objectAtIndex:indexPath.row];
    
    /*  set up party image in the future
     
     NSURL *url;
     if (party.image != nil)
     url = [[NSURL alloc] initWithString:party.image];
     
     [cell.partyimage setImageWithURL:[NSURL URLWithString:party.image]];
     cell.partyimage = [LHUtility roundCornerImage:cell.partyimage];
     */
    
    cell.attendentNameLabel.text = attendee.name;
    
    return cell;
}

/*
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
 */
@end
