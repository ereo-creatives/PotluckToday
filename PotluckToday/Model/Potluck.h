//
//  Potluck.h
//  PotluckToday
//
//  Created by Ryan on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <Mantle/Mantle.h>

@interface Potluck : MTLModel

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *contact;
@property (nonatomic, retain) NSDate *time;
@property (nonatomic) NSDateFormatter* dateFormatter;

-(void) setPartyTime:(NSString *) dateString;
-(NSString *) getPartyTime;

@end
