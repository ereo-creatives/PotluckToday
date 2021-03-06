//
//  ECBlocks.h
//  PodluckToday
//
//  Created by Ryan on 9/9/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//
#import <AFNetworking.h>

typedef void (^CompletionBlock)(NSError* error);

typedef void (^BooleanCompletionBlock)(BOOL result, NSError* error);

typedef void (^ObjectCompletionBlock)(id object, NSError* error);

typedef void (^UserCompletionBlock)(PFUser* user, NSError* error);

typedef void (^ArrayCompletionBlock)(NSArray* array, NSError* error);

//typedef void (^RequestOperationConfigBlock)(RequestOperationConfig *config);
