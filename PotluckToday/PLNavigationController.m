//
//  PLNavigationController.m
//  PotluckToday
//
//  Created by Ryan on 12/24/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLNavigationController.h"
#import "REFrostedViewController.h"

@interface PLNavigationController ()

@end

@implementation PLNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)panGestureRecognized:(UIPanGestureRecognizer*)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];

    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}

@end
