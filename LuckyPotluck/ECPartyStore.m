//
//  ECPartyStore.m
//  LuckyPotluck
//
//  Created by Ryan on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "ECPartyStore.h"

@implementation ECPartyStore
{
    NSManagedObjectContext *_context;
    NSManagedObjectModel *_model;
    NSMutableArray *_allPotlucks;
}
- (id)init
{
    self = [super init];
    if (self) {
        // Set up our model and context
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        NSURL *storeURL = [NSURL fileURLWithPath:self.modelPath];

        NSError *error;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            [NSException raise:@"Open Failed" format:@"Reason: %@", error.localizedDescription];
        }

        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = psc;
        _context.undoManager = nil;
    }
    return self;
}
+ (ECPartyStore *)sharedStore
{
    static ECPartyStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}
+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}
- (Potluck *)createPotluck
{
    Potluck *potluck = [NSEntityDescription insertNewObjectForEntityForName:@"Potluck" inManagedObjectContext:_context];
    [_allPotlucks addObject:potluck];
    return potluck;
}
- (NSArray *)allTasks
{
    if (!_allPotlucks) {
        NSFetchRequest *req = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [_model.entitiesByName objectForKey:@"Potluck"];
        req.entity = e;

        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"created" ascending:YES];
        req.sortDescriptors = @[sd];

        // Fetch
        NSError *error;
        NSArray *result = [_context executeFetchRequest:req error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", error.localizedDescription];
        }
        _allPotlucks = [[NSMutableArray alloc] initWithArray:result];
    }
    return _allPotlucks;
}
- (NSString *)modelPath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}
@end
