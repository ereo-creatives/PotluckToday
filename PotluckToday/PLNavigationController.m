//
//  PLNavigationController.m
//  PotluckToday
//
//  Created by Ryan on 12/24/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLNavigationController.h"

@interface PLNavigationController ()

@end

@implementation PLNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (UIViewController*)rootViewController
{
    return [[self viewControllers] objectAtIndex:0];
}
@end
