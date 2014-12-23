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

@interface PLLoginViewController ()

@end

@implementation PLLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];

    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)facebookLogin:(id)sender
{
    NSArray* permissionsArray = @[ @"public_profile", @"user_about_me", @"user_birthday", @"user_location", @"email", @"user_friends" ];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser* user, NSError* error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error = nil;
            //try refreshing the user in case that is the problem (its not, sometimes?).
            [user fetch:&error];
            if (error) {
                NSLog(@"ERROR. %@", error.localizedDescription);
            }
            NSLog(@"%@", user);

            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];

                if (!user) {
                    NSString *errorMessage = nil;
                    if (!error) {
                        NSLog(@"User cancelled the Facebook login.");
                        errorMessage = @"User cancelled the Facebook login.";
                    } else {
                        NSLog(@"Uh oh. An error occurred: %@", error);
                        errorMessage = [error localizedDescription];
                    }
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
                                                                    message:errorMessage
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];
                } else {
                    if (user.isNew) {
                        NSLog(@"User for Facebook! (new user)");

                        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];

                        FBRequest *request = [FBRequest requestForMe];
                        [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                            [SVProgressHUD dismiss];
                            if (!error) {
                                NSDictionary *userData = (NSDictionary *)result;
                                NSString *name = userData[@"name"];
                                user[@"email"] = userData[@"email"];
                                user[@"displayName"] = name;
                                user[@"facebookName"] = name;
                                user[@"facebookId"] = [result objectForKey:@"id"];

                                [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];

                                [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                    [SVProgressHUD dismiss];

                                    if (error) {
                                        NSLog(@"%@", error.description);
                                    }
                                    NSLog(@"User saved");
                                }];
                                NSLog(@"User signed up and logged in through Facebook!");

                            } else {
                                if ([error.userInfo[FBErrorParsedJSONResponseKey][@"body"][@"error"][@"type"] isEqualToString:@"OAuthException"]) {
                                    NSLog(@"The facebook session was invalidated");
                                }
                                else {
                                    NSLog(@"Some other error: %@", error);
                                }
                            }
                        }];
                    } else {
                        NSLog(@"User logged in through Facebook!");

                        if (!user[@"displayName"] || !user[@"facebookName"] || !user[@"facebookId"]) {

                            [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];

                            FBRequest *request = [FBRequest requestForMe];
                            [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                [SVProgressHUD dismiss];

                                if (!error) {
                                    NSDictionary *userData = (NSDictionary *)result;
                                    NSString *name = userData[@"name"];
                                    user[@"email"] = userData[@"email"];
                                    user[@"displayName"] = name;
                                    user[@"facebookName"] = name;
                                    user[@"facebookId"] = [result objectForKey:@"id"];

                                    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                        if (error) {
                                            NSLog(@"%@", error.description);
                                        }
                                        NSLog(@"456");
                                    }];

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
                        else {
                            NSLog(@"123");
                        }
                    }
                }
                
            });
        });

    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
