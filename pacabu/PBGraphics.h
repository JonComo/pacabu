//
//  PBGraphics.h
//  pacabu
//
//  Created by Jon Como on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COLORA [UIColor colorWithRed:0.933 green:0.647 blue:0.243 alpha:1.000]
#define COLORB [UIColor colorWithRed:0.631 green:0.847 blue:0.733 alpha:1.000]
#define COLORC [UIColor colorWithRed:0.933 green:0.914 blue:0.890 alpha:1.000]
#define COLORD [UIColor colorWithRed:0.639 green:0.627 blue:0.608 alpha:1.000]
#define COLORE [UIColor colorWithRed:0.118 green:0.106 blue:0.082 alpha:1.000]

@interface PBGraphics : NSObject

+(void)initGraphics;
+(UIImage *)cellBorder;
+(UIColor *)darkTexture;

+(void)buttonDone:(UIButton *)button;

@end
