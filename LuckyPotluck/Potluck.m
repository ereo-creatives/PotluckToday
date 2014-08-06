//
//  Potluck.m
//  LuckyPotluck
//
//  Created by Ryan on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "Potluck.h"


@implementation Potluck

@dynamic name;
@dynamic time;
@dynamic location;
@dynamic contact;


- (void)awakeFromInsert
{
    self.time = [NSDate date];
    self.location = @"My Location";
    self.contact=@"My Contact";
    self.name = @"New Party";
}
@end
