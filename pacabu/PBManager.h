//
//  PBManager.h
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBManager : NSObject

+(PBManager *)sharedManager;

-(void)activitiesOptions:(NSDictionary *)options completion:(void (^)(BOOL success, NSArray *objects))block;

@end