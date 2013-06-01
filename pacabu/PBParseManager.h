//
//  PBParseManager.h
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFQuery;

@interface PBParseManager : NSObject

+(PBParseManager *)sharedManager;

-(void)runQuery:(PFQuery *)query completion:(void (^)(BOOL success, NSArray *objects))block;

@end