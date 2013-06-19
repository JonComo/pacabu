//
//  PBActivityCell.m
//  pacabu
//
//  Created by Jon Como on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBActivityCell.h"
#import "PBGraphics.h"

@implementation PBActivityCell

-(void)setup
{
    self.imageViewBackground.layer.masksToBounds = YES;
    [self.imageViewBackground setImage:[UIImage imageNamed:@"travel_1.jpg"]];
}

-(UIViewController *)detailViewController
{
    UIStoryboard *secondaryStoryboard = [UIStoryboard storyboardWithName:@"SecondaryStoryboard" bundle:[NSBundle mainBundle]];
    
    UIViewController *detail = [secondaryStoryboard instantiateViewControllerWithIdentifier:@"ActivityDetailVC"];
    
    //detail.activity = thing;
    
    return detail;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
