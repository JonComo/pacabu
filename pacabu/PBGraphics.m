//
//  PBGraphics.m
//  pacabu
//
//  Created by Jon Como on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBGraphics.h"

@implementation PBGraphics

+(UIImage *)tabBar
{
    return [[UIImage imageNamed:@"tabBarBackground"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
}

+(void)initGraphics
{
    [[UINavigationBar appearance] setBackgroundImage:[PBGraphics navigationBar] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20], UITextAttributeTextColor : COLORB, UITextAttributeTextShadowColor : COLORB}];
    
    [[UIBarButtonItem appearance] setTintColor:COLORC];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{UITextAttributeTextShadowColor: [UIColor clearColor]} forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setBackgroundImage:nil
                                            forState:UIControlStateNormal
                                               style:UIBarButtonItemStyleDone
                                          barMetrics:UIBarMetricsDefault];
    
    [[UITabBar appearance] setBackgroundImage:[PBGraphics tabBar]];
    
    [[UIRefreshControl appearance] setTintColor:COLORB];
    
}

+(UIImage *)cellBorder
{
    return [[UIImage imageNamed:@"cellBorder"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2) resizingMode:UIImageResizingModeStretch];
}

+(UIImage *)navigationBar
{
    return [[UIImage imageNamed:@"navigationBar"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
}

+(UIColor *)darkTexture
{
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"darkTexture"]];
}

+(void)buttonDone:(UIButton *)button
{
    [button setBackgroundImage:[PBGraphics buttonImageWithName:@""] forState:UIControlStateNormal];
    [button setBackgroundImage:[PBGraphics buttonImageWithName:@""] forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:COLORB forState:UIControlStateHighlighted];
}

+(UIImage *)buttonImageWithName:(NSString *)name
{
    return [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
}

@end