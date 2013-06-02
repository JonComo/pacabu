//
//  JCMultiView.h
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCMultiView : UIView

@property (nonatomic, strong) NSArray *nibNames;
@property u_int currentIndex;

-(void)setVisibleView:(int)index;

@end