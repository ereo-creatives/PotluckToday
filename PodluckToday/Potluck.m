//
//  Potluck.m
//  PotluckToday
//
//  Created by Ryan on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "Potluck.h"


@implementation Potluck
{
    
}

@synthesize name, time, location, contact;

- (instancetype)init;
{
    Potluck *potluck = [super init];
    potluck.dateFormatter = [[NSDateFormatter alloc] init];
    [potluck.dateFormatter setDateFormat:@"MMM dd, yyyy hh:mm a"];
    return self;
}
-(void) setPartyTime:(NSString *) dateString
{
    time = [_dateFormatter dateFromString:dateString];
}

-(NSString *) getPartyTime
{
    return [_dateFormatter stringFromDate:time];
}

@end
