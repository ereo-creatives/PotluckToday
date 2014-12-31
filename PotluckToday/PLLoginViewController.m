//
//  PLLoginViewController.m
//  PotluckToday
//
//  Created by Ryan on 12/24/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLLoginViewController.h"
#import "ECUserManager.h"
#import "REFrostedViewController.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface PLLoginViewController () {
    UIPanGestureRecognizer* _panGestureRec;
}

@end

@implementation PLLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _panGestureRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    if ([ECUserManager isLoggedIn]) {
        [self enableMenuFeature];
    }
    else {
        [self disableMenuFeature];
    }
}

- (void)enableMenuFeature
{
    self.navigationItem.leftBarButtonItem.title = @"Menu";
    [self.view addGestureRecognizer:_panGestureRec];
}

- (void)disableMenuFeature
{
    self.navigationItem.leftBarButtonItem.title = @"Login";
    [self.view removeGestureRecognizer:_panGestureRec];
}

- (void)loggedIn
{

    [self enableMenuFeature];
}

- (void)logout
{

    [self disableMenuFeature];
    [PFUser logOut];
}

- (IBAction)leftMenuButtonTapped
{
    if ([ECUserManager isLoggedIn]) {
        [self showSideMenu];
    }
    else {
        [self facebookLogin];
    }
}

- (void)facebookLogin
{
    NSArray* permissionsArray = @[ @"public_profile", @"user_about_me", @"user_birthday", @"user_location", @"email", @"user_friends" ];
    [self showIndicator];
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser* user, NSError* error) {
        [self hideIndicator];
        [self showIndicator];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error = nil;
            [user fetch:&error];
            if (error) {
                NSLog(@"ERROR. %@", error.localizedDescription);
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self hideIndicator];
                if (!user) {
                    NSString *errorMessage = nil;
                    if (!error) {
                        NSLog(@"User cancelled the Facebook login.");
                        errorMessage = @"User cancelled the Facebook login.";
                    } else {
                        NSLog(@"Uh oh. An error occurred: %@", error);
                        errorMessage = [error localizedDescription];
                    }
                    [TSMessage showNotificationWithTitle:@"Log In Error"
                                                subtitle:errorMessage
                                                    type:TSMessageNotificationTypeError];
                } else {
                    FBRequest *request = [FBRequest requestForMe];
                    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                        [self hideIndicator];
                        if (!error) {
                            [ECUserManager saveUser:user withDictionary:result completion:^(BOOL result, NSError *error) {
                                [TSMessage showNotificationWithTitle:user.isNew ? @"Sign Up Successful!" : @"Login Successful"
                                                                type:TSMessageNotificationTypeSuccess];
                            }];
                            [self enableMenuFeature];
                        } else {
                            if ([error.userInfo[FBErrorParsedJSONResponseKey][@"body"][@"error"][@"type"] isEqualToString:@"OAuthException"]) {
                                NSLog(@"The facebook session was invalidated");
                            }
                            else {
                                NSLog(@"Some other error: %@", error);
                            }
                        }
                    }];
                }
                
            });
        });

    }];
}

- (void)panGestureRecognized:(UIPanGestureRecognizer*)sender
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController panGestureRecognized:sender];
}

- (void)showSideMenu
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController presentMenuViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
