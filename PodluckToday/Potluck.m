//
//  Potluck.m
//  PotluckToday
//
//  Created by Ryan on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "Potluck.h"


@implementation Potluck

@synthesize name, time, location, contact;

- (void)awakeFromInsert
{
    self.time = [NSDate date];
    self.location = @"My Location";
    self.contact = @"My Contact";
    self.name = @"New Party";
}
@end
