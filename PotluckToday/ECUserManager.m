//
//  ECUserManager.m
//  PotluckToday
//
//  Created by Ryan on 12/23/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "ECUserManager.h"
#import <PFFacebookUtils.h>
@implementation ECUserManager

+ (BOOL)isLoggedIn
{
    return [PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]];
}

+ (BOOL)hasCompleteDataIn:(PFUser*)user
{
    return user[@"displayName"] && user[@"facebookName"] && user[@"facebookId"];
}

+ (void)saveUser:(PFUser*)user withDictionary:(NSDictionary*)userData completion:(BooleanCompletionBlock)block;
{
    NSString* name = userData[@"name"];
    user[@"email"] = userData[@"email"];
    user[@"displayName"] = name;
    user[@"facebookName"] = name;
    user[@"facebookId"] = [userData objectForKey:@"id"];

    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError* error) {
        block(succeeded, error);
    }];
}

@end
