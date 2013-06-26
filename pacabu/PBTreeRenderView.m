//
//  PBTreeRenderView.m
//  pacabu
//
//  Created by Jon Como on 6/25/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBTreeRenderView.h"

@implementation PBTreeRenderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    [[UIColor blackColor] setStroke];
    
    for (id attachmentItem in self.attachmentItems)
    {
        if ([attachmentItem isMemberOfClass:[UIAttachmentBehavior class]]) {
            //draw ling
            
            UIAttachmentBehavior *attach = (UIAttachmentBehavior *)attachmentItem;
            
            UIView *item;
            
            if (attach.items.count != 0)
                item = attach.items[0];
            
            CGPoint startPoint = CGPointMake(self.currentView.frame.origin.x + self.currentView.frame.size.width/2, self.currentView.frame.origin.y + self.currentView.frame.size.height/2);
            
            CGPoint endPoint = CGPointMake(item.frame.origin.x + item.frame.size.width/2, item.frame.origin.y + item.frame.size.height/2);
            
            CGContextMoveToPoint(ref, startPoint.x, startPoint.y);
            
            CGContextAddLineToPoint(ref, item.frame.origin.x + item.frame.size.width/2, item.frame.origin.y + item.frame.size.height/2);
            
            
            CGContextStrokePath(ref);
        }
    }
}


@end
