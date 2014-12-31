//
//  ECDefaultViewController.m
//  PodluckToday
//
//  Created by Ryan on 9/9/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "ECDefaultViewController.h"

@interface ECDefaultViewController ()

@end

@implementation ECDefaultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [TSMessage setDefaultViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showIndicator
{
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
}

- (void)hideIndicator

{
    [SVProgressHUD dismiss];

}
@end
