//
//  Attendee.h
//  PotluckToday
//
//  Created by Elisha Fu on 8/6/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <Mantle/Mantle.h>

@interface Attendee : MTLModel

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * food;

@end
