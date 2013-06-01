//
//  PBManager.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBManager.h"
#import "PBParseManager.h"
#import <Parse/Parse.h>

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

-(void)activitiesCompletion:(void (^)(BOOL success, NSArray *objects))block
{
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    
    query.limit = 25;
    
    [[PBParseManager sharedManager] runQuery:query completion:block];
}

@end
