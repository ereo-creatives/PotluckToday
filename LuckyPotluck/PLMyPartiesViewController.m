//
//  PLMyPartiesViewController.m
//  LuckyPotluck
//
//  Created by Yen-Han Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLMyPartiesViewController.h"
#import "PLParty.h"
#import "PLAttendees.h"
#import "PLPartyCell.h"
#import "PLPartyDetailCell.h"

@interface PLMyPartiesViewController ()

@property NSArray* partyArr;


@end

@implementation PLMyPartiesViewController
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark Tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_partyArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark Tableview Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
