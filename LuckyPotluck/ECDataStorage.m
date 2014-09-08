//
//  ECDataStorage.m
//  LuckyPotluck
//
//  Created by Ryan on 9/8/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "ECDataStorage.h"
#import <Firebase/Firebase.h>

@implementation ECDataStorage {
    Firebase* _rootref;
}

+ (ECDataStorage *)sharedInstance
{
    //  Static local predicate must be initialized to 0
    static ECDataStorage *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ECDataStorage alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(id)init {
    // Write data to Firebase
    //    [myRootRef setValue:@"Do you have data? You'll love Firebase."];
    //    [myRootRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
    //        NSLog(@"%@ -> %@", snapshot.name, snapshot.value);
    //    }];
    if ( self = [super init] ) {
        _rootref = [[Firebase alloc] initWithUrl:FIREBASE_URL];
    }
    return self;
}


@end
