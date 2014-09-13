//
//  PLReviewViewController.m
//  PotluckToday
//
//  Created by Ryan Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLReviewViewController.h"

@interface PLReviewViewController ()

@property (weak, nonatomic) IBOutlet UILabel *partyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *partyTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *partyAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;

@end

@implementation PLReviewViewController
@synthesize potluck = _potluck;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _partyNameLabel.text = _potluck.name;
    _partyAddressLabel.text = _potluck.location;
    _contactLabel.text = _potluck.contact;
    _partyTimeLabel.text = [_potluck getPartyTime];
}

@end
