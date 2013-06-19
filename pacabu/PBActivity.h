//
//  PBActivity.h
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import <Parse/Parse.h>

@interface PBActivity : PFObject

@property (nonatomic, strong) NSMutableArray *images;

+(PBActivity *)new;

-(void)saveCompletion:(void (^)(BOOL success))block;

@end