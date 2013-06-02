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
        returnView = [self viewFromNibName:nibName];
    }
    
    return returnView;
}

-(UIView *)viewFromNibName:(NSString *)nibName
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
    
    UIView *viewToDisplay = [self viewAtIndex:index];
    viewToDisplay.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    UIView *viewToHide;
    
    if (self.subviews.count != 0)
        viewToHide = self.subviews[0];
    
    [self addSubview:viewToDisplay];
    
    int offset = self.frame.size.width;
    
    if (previousIndex > index) offset *= -1;
    
    viewToDisplay.transform = CGAffineTransformMakeTranslation(offset, 0);
    
    [UIView animateWithDuration:0.3 animations:^{
        viewToDisplay.transform = CGAffineTransformIdentity;
        viewToHide.transform = CGAffineTransformTranslate(viewToHide.transform, -offset, 0);
    } completion:^(BOOL finished) {
        //[viewToHide removeFromSuperview];
    }];
    
    NSLog(@"SUbviews: %i", self.subviews.count);
    
    previousIndex = index;
}

/*
-(void)setVisibleView:(int)index
{
    if (index < 0 || index > self.nibNames.count - 1)
        return;
    
    if (self.currentIndex == index && self.subviews.count != 0)
        return;
    
    self.currentIndex = index;
    
    UIView *viewToDisplay;
    UIView *viewToRemove;
    
    viewToDisplay = [self viewAtIndex:index];
    
    if (!viewToDisplay)
    {
        viewToDisplay = [self viewFromNibName:self.nibNames[index]];
        
        views[self.nibNames[index]] = viewToDisplay;
    }
    
    //If there isn't a view to transition from just add the selected initial view
    
    if (self.subviews.count == 0)
    {
        [self addSubview:viewToDisplay];
    }else{
        //Otherwise animate the transition
        
        viewToRemove = self.subviews[0];
        
        [self addSubview:viewToDisplay];
        
        int offset = viewToRemove.frame.size.width;
        
        if (previousIndex > index)
            offset *= -1;
        
        viewToDisplay.transform = CGAffineTransformMakeTranslation(offset, 0);
        
        [UIView animateWithDuration:0.3 animations:^{
            isAnimating = YES;
            viewToRemove.transform = CGAffineTransformTranslate(viewToRemove.transform, -offset, 0);
            viewToDisplay.transform = CGAffineTransformTranslate(viewToDisplay.transform, -offset, 0);
        } completion:^(BOOL finished) {
            [viewToRemove removeFromSuperview];
            isAnimating = NO;
        }];
    }
    
    previousIndex = index;
}
 */

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

@end
