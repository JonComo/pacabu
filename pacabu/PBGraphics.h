//
//  PBGraphics.h
//  pacabu
//
//  Created by Jon Como on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COLORA [UIColor colorWithRed:0.004 green:0.133 blue:0.063 alpha:1.000] //diff
#define COLORB [UIColor colorWithRed:1.000 green:0.859 blue:0.369 alpha:1.000]
#define COLORC [UIColor colorWithRed:0.933 green:0.725 blue:0.137 alpha:1.000]
#define COLORD [UIColor colorWithRed:0.533 green:0.529 blue:0.404 alpha:1.000]
#define COLORE [UIColor colorWithRed:0.204 green:0.329 blue:0.208 alpha:1.000]

@interface PBGraphics : NSObject

+(void)initGraphics;
+(UIImage *)cellBorder;

@end
