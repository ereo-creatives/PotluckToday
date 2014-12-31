//
//  PLHomeViewController.m
//  PotluckToday
//
//  Created by Ryan Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLHomeViewController.h"

@interface PLHomeViewController ()

@end

@implementation PLHomeViewController

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"]; //PLLoginViewController
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"]; //PLNavigationController
    self.backgroundFadeAmount = 0.4;
    self.liveBlur = NO;
    self.blurRadius = 30;
//    self.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
