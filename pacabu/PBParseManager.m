//
//  PBParseManager.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBParseManager.h"
#import "JCAlertViewManager.h"
#import <Parse/Parse.h>

@implementation PBParseManager

+(PBParseManager *)sharedManager
{
    static PBParseManager *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

-(void)saveObject:(PFObject *)object completion:(void (^)(BOOL success))block
{
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (block) block(succeeded);
    }];
}

-(void)runQuery:(PFQuery *)query completion:(void (^)(BOOL success, NSArray *objects))block
{
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error){
            [self handleParseError:error];
            if (block) block(NO, nil);
            return;
        }
        
        if (block) block(YES, objects);
    }];
}

-(void)handleParseError:(NSError *)error
{
    [[JCAlertViewManager sharedManager] alertViewWithTitle:@"Error" message:[error description] cancelButton:@"Dang.. Ok" buttons:nil completion:nil];
}

@end
