//
//  ECDataStorage.h
//  PotluckToday
//
//  Created by Ryan on 9/8/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <Firebase/Firebase.h>

@interface ECDataStorage : NSObject
{

}

+(ECDataStorage *) sharedInstance;
-(Firebase *) getFirebase;
-(void) test;

@end
