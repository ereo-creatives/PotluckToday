//
//  ECUserManager.h
//  PotluckToday
//
//  Created by Ryan on 12/23/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECUserManager : NSObject

+ (BOOL)isLoggedIn;
+ (BOOL)hasCompleteDataIn:(PFUser*)user;
+ (void)saveUser:(PFUser*)user withDictionary:(NSDictionary*)userData completion:(BooleanCompletionBlock)block;

@end
