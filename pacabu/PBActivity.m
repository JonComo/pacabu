//
//  PBActivity.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBActivity.h"
#import "PBParseManager.h"
#import <Parse/Parse.h>

@implementation PBActivity

-(id)init
{
    if (self = [super init]) {
        //init
        
        _object = [PFObject objectWithClassName:@"Activity"];
        [_object setObject:[PFUser currentUser] forKey:@"user"];
    }
    
    return self;
}

-(id)initWithObject:(PFObject *)object
{
    if (self = [super init]) {
        //init
        
        _object = object;
    }
    
    return self;
}

-(void)saveCompletion:(void (^)(BOOL success))block
{
    [[PBParseManager sharedManager] saveObject:self.object completion:block];
}

@end