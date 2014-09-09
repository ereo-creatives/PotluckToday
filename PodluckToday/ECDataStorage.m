//
//  ECDataStorage.m
//  LuckyPotluck
//
//  Created by Ryan on 9/8/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "ECDataStorage.h"
#import <Firebase/Firebase.h>

@implementation ECDataStorage
{
    Firebase* _rootref;
}

+ (ECDataStorage *)sharedInstance
{
    //  Static local predicate must be initialized to 0
    static ECDataStorage *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ECDataStorage alloc] init];
    });
    return sharedInstance;
}

-(id)init
{
    if ( self = [super init] )
    {
        _rootref = [[Firebase alloc] initWithUrl:FIREBASE_URL];
    }
    return self;
}

-(void) test
{
    // Write data to Firebase
//    NSDictionary *alanisawesome = @{
//                                    @"full_name" : @"Alan Turing",
//                                    @"date_of_birth": @"June 23, 1912"
//                                    };
    NSDictionary *event = @{
                            @"author": @"erhsthsrthsrt",
                            @"title": @"Aaergaere"
                            };
    [_rootref childByAppendingPath:@"NYC"];
    Firebase *fb2 =[_rootref childByAutoId];
    [fb2 setValue:event];
//    [_rootref setValue:@"Do you have data? You'll love Firebase."];
//    [_rootref observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
//        NSLog(@"%@ -> %@", snapshot.name, snapshot.value);
//    }];

}

@end
