//
//  ECUserManager.h
//  PodluckToday
//
//  Created by Ryan on 9/9/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECUserManager : NSObject

+(ECUserManager *) sharedInstance;

+(void) login: (UserCompletion) loginCompletionBlock;
+(void) saveCurrentUser: (UserCompletion) userCompletionBlock;
+(NSString *) getUserIdentifier: (FAUser *)user;

@end
