//
//  PLSideMenuViewController.m
//  PotluckToday
//
//  Created by Ryan Wu on 12/24/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLSideMenuViewController.h"
#import "PLLoginViewController.h"
#import "PLNavigationController.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface PLSideMenuViewController ()

@end

@implementation PLSideMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (PLNavigationController*)navigateViewController
{
    REFrostedViewController* homeVC = self.frostedViewController;
    return (PLNavigationController*)homeVC.contentViewController;
}
- (PLLoginViewController*)appRootView
{
    PLNavigationController* navVC = [self navigateViewController];
    PLLoginViewController* loginVC = (PLLoginViewController*)[navVC rootViewController];
    return loginVC;
}
- (IBAction)hostPartyAction:(id)sender
{
    [self segueAction:@"hostParty"];
}
- (IBAction)test:(id)sender
{
    [[self appRootView] logout];
    [self.frostedViewController hideMenuViewController];
}

- (void)segueAction:(NSString*)identifier
{
    [[self appRootView] performSegueWithIdentifier:identifier sender:[self appRootView]];
    [self.frostedViewController hideMenuViewController];
}
@end
