//
//  PBActivity.h
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;

@interface PBActivity : NSObject

@property (nonatomic, strong) PFObject *object;

-(id)initWithObject:(PFObject *)object;
-(void)saveCompletion:(void (^)(BOOL success))block;

@end