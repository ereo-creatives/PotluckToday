//
//  ECPartyStore.h
//  LuckyPotluck
//
//  Created by Ryan on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Potluck;

@interface ECPartyStore : NSObject
+ (ECPartyStore *) sharedStore;
- (NSArray *) allPotlucks;
- (Potluck *) createPotluck;
- (void)removeTask:(Potluck *) potluck;

@end

