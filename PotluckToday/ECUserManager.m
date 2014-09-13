//
//  ECUserManager.m
//  PodluckToday
//
//  Created by Ryan on 9/9/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "ECUserManager.h"
#import "ECDataStorage.h"
#import <Firebase/Firebase.h>
#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>


@interface ECUserManager ()

@property (nonatomic, strong) FAUser *currentUser;
@property (nonatomic, strong) FirebaseSimpleLogin *simpleLogin;

@end

@implementation ECUserManager

+ (ECUserManager *)sharedInstance
{
    static ECUserManager *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ECUserManager alloc] init];
    });
    return sharedInstance;
}



+(void) login: (UserCompletion) loginCompletionBlock
{
    ECUserManager *manager = [ECUserManager sharedInstance];
    [manager.simpleLogin loginToFacebookAppWithId:FACEBOOK_APP_ID
                                      permissions:@[@"public_profile",@"email"]
                                         audience:ACFacebookAudienceOnlyMe
                              withCompletionBlock:loginCompletionBlock];

    //     [manager loginBlockForProviderName:@"Facebook"]];
}

+(void) saveCurrentUser: (UserCompletion) userCompletionBlock
{
    ECUserManager *manager = [ECUserManager sharedInstance];
    Firebase *firebase = [[ECDataStorage sharedInstance] getFirebase];
    [manager.simpleLogin checkAuthStatusWithBlock:^(NSError *error, FAUser *user) {
        if (error != nil) {
            [TSMessage showNotificationWithTitle:@"Save Error"
                                        subtitle:[error localizedDescription]
                                            type:TSMessageNotificationTypeError];
        } else if (user == nil) {
            [TSMessage showNotificationWithTitle:@"Save Error"
                                        subtitle:@"Invalid User"
                                            type:TSMessageNotificationTypeError];
        } else {

            Firebase *userFirebase = [firebase childByAppendingPath: [self getUserIdentifier:user]];
            [userFirebase observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
                BOOL isNewUser = [snapshot value] == [NSNull null];
                if (isNewUser) {
                    // save them to the users location
                    NSMutableDictionary *newUser = [NSMutableDictionary new];
                    [newUser addEntriesFromDictionary:  @{
                                                          @"user_id": user.userId,
                                                          @"provider": [[NSNumber alloc] initWithInt:user.provider],
                                                          @"created_time": kFirebaseServerValueTimestamp ,
                                                          @"last_login": kFirebaseServerValueTimestamp
                                                          }];
                    [newUser addEntriesFromDictionary: [user.thirdPartyUserData objectForKey: @"thirdPartyUserData"]];
                    [userFirebase setValue:newUser];
                } else {
                    NSMutableDictionary *oldUser = [NSMutableDictionary new];
                    [oldUser addEntriesFromDictionary:@{@"last_login": kFirebaseServerValueTimestamp}];
                    [userFirebase updateChildValues:oldUser];

                }
                userCompletionBlock(error, user);
                [userFirebase removeAllObservers];
            }];
        }
    }];

}
+(NSString *) getUserIdentifier: (FAUser *)user
{
    return [NSString stringWithFormat:@"users/%@-%@", [[NSNumber alloc] initWithInt:user.provider],user.userId];
}

-(id)init
{
    if ( self = [super init] )
    {
        Firebase *firebase = [[ECDataStorage sharedInstance] getFirebase];
        self.simpleLogin = [[FirebaseSimpleLogin alloc] initWithRef:firebase];
    }
    return self;
}

@end
