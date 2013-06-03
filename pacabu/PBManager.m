//
//  PBManager.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBManager.h"
#import "PBParseManager.h"

@implementation PBManager

+(PBManager *)sharedManager
{
    static PBManager *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

-(id)init
{
    if (self = [super init]) {
        //init
        
    }
    
    return self;
}

-(void)activitiesOptions:(NSDictionary *)options completion:(void (^)(BOOL, NSArray *))block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    
    query.limit = 25;
    
    [query includeKey:@"user"];
    
    for (NSString *key in options){
        [query setValue:options[key] forKeyPath:key];
    }
    
    [[PBParseManager sharedManager] runQuery:query completion:block];
}

@end
