//
//  JCMultiView.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "JCMultiView.h"

@implementation JCMultiView
{
    u_int previousIndex;
    NSMutableDictionary *views;
    
    UIView *viewToDisplay;
    UIView *viewToHide;
}

-(void)setNibNames:(NSArray *)nibNames
{
    _nibNames = nibNames;
    
    if (!views)
        views = [NSMutableDictionary dictionary];
}

-(UIView *)viewAtIndex:(u_int)index
{
    UIView *returnView;
    
    NSString *nibName = self.nibNames[index];
    
    for (NSString *key in views){
        if ([key isEqualToString:nibName]){
            returnView = views[key];
        }
    }
    
    if (!returnView)
    {
        returnView = [self viewForNibName:nibName];
    }
    
    return returnView;
}

-(UIView *)viewForNibName:(NSString *)nibName
{
    UIView *view = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil][0];
    view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    views[nibName] = view;
    
    return view;
}

-(NSString *)nibAtIndex:(u_int)index
{
    if (index > self.nibNames.count - 1){
        return nil;
    }
    
    return self.nibNames[index];
}

-(void)setVisibleView:(int)index
{
    NSString *nibName = [self nibAtIndex:index];
    if (!nibName) return;
    
    self.currentIndex = index;
    
    for (UIView *subview in self.subviews)
        [subview removeFromSuperview];
    
    viewToDisplay = [self viewAtIndex:index];
    [self addSubview:viewToDisplay];
    
    previousIndex = index;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

@end
