//
//  PLMyPartiesViewController.h
//  LuckyPotluck
//
//  Created by Yen-Han Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLMyPartiesViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end