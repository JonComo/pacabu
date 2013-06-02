//
//  PBActivity.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBActivity.h"
#import "PBParseManager.h"

@implementation PBActivity

+(PBActivity *)new
{
    PBActivity *newActivity = [[self alloc] initWithClassName:@"Activity"];
    
    if ([PFUser currentUser])
        [newActivity setObject:[PFUser currentUser] forKey:@"user"];
    
    return newActivity;
}

-(void)saveCompletion:(void (^)(BOOL success))block
{
    [[PBParseManager sharedManager] saveObject:self completion:block];
}

@end