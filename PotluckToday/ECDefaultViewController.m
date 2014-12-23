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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
