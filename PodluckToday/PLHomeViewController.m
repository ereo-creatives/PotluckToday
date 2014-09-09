//
//  PLHomeViewController.m
//  PotluckToday
//
//  Created by Ryan Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLHomeViewController.h"
#import "ECDataStorage.h"
#import "ECUserManager.h"

@interface PLHomeViewController ()


@end

@implementation PLHomeViewController

- (IBAction)facebookLogin:(id)sender
{
    [ECUserManager login:[self loginBlockForProviderName:@"Facebook"]];
   
}

- (void(^)(NSError *, FAUser *))loginBlockForProviderName:(NSString *)providerName
{
    // this callback block can be used for every login method
    return ^(NSError *error, FAUser *user) {
        // make sure we are on the main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            // hide the login progress dialog
            //            [self.loginProgressAlert dismissWithClickedButtonIndex:0 animated:YES];
            //            self.loginProgressAlert = nil;
            if (error != nil) {
                // there was an error authenticating with Firebase
                NSLog(@"Error logging in to Firebase: %@", error);
                // display an alert showing the error message
                NSString *message = [NSString stringWithFormat:@"There was an error logging into Firebase using %@: %@",
                                     providerName,
                                     [error localizedDescription]];
                //                [self showErrorAlertWithMessage:message];
                [TSMessage showNotificationWithTitle:@"Login Error"
                                            subtitle:message
                                                type:TSMessageNotificationTypeError];

            } else {
                // all is fine, set the current user and update UI
                [self updateUIAndSetCurrentUser:user];
            }
        });
    };
}

- (void)updateUIAndSetCurrentUser:(FAUser *)currentUser
{
//    [ECUserManager saveCurrentUser: currentUser];
    if (currentUser == nil) {
        // The is no user authenticated, so show the login buttons and hide the logout button

    } else {
        NSString *userEmail = [currentUser.thirdPartyUserData objectForKey: @"email"];
        [TSMessage showNotificationWithTitle:@"Login Success!"
                                    subtitle:userEmail
                                        type:TSMessageNotificationTypeSuccess];
        [ECUserManager saveCurrentUser:^(NSError *error, FAUser *user) {
            if (error == nil)
            {
                //Redirect in
            }
        }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
