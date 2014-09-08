//
//  Potluck.h
//  LuckyPotluck
//
//  Created by Ryan on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Potluck : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSDate *time;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *contact;

@end
