//
//  PLMyPartyDetailViewController.h
//  LuckyPotluck
//
//  Created by Ryan Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Potluck.h"
#import "Attendee.h"

@interface PLMyPartyDetailViewController : UITableViewController <UITableViewDataSource>

@property Potluck* selectedParty;

@end
