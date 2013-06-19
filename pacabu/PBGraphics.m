//
//  PBGraphics.m
//  pacabu
//
//  Created by Jon Como on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBGraphics.h"

@implementation PBGraphics

+(void)initGraphics
{
    
}

+(UIImage *)cellBorder
{
    return [[UIImage imageNamed:@"cellBorder"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch];
}

@end