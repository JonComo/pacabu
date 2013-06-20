//
//  PBTreeViewController.m
//  pacabu
//
//  Created by Jon Como on 6/19/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBTreeViewController.h"
#import "PBGraphics.h"
#import "JCMath.h"

@import CoreMotion;

@interface PBTreeViewController () <UIDynamicAnimatorDelegate>
{
    UIDynamicAnimator *animator;
    UICollisionBehavior *collision;
    
    UIButton *currentView;
    NSMutableArray *childViews;
    NSMutableSet *linksCollection;
    
    UIGravityBehavior *grav;
    
    UIAttachmentBehavior *centerSpring;
    UIDynamicItemBehavior *childBehaviors;
    
    CMMotionManager *manager;
}

@end

@implementation PBTreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    childViews = [NSMutableArray array];
    linksCollection = [NSMutableSet set];
    
    //setup first view
    currentView = [self buttonWithText:@"Hello" origin:CGPointMake(20, 20) size:32];
    [self.view addSubview:currentView];
    
    [currentView addTarget:self action:@selector(dive:) forControlEvents:UIControlEventTouchUpInside];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    animator.delegate = self;
    
    grav = [UIGravityBehavior new];
    [animator addBehavior:grav];
    
    [grav addItem:currentView];
    
    collision = [[UICollisionBehavior alloc] init];
    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
    
    centerSpring = [[UIAttachmentBehavior alloc] initWithItem:currentView attachedToAnchor:CGPointMake(320/2, 460/2)];
    
    [collision addItem:currentView];
    
    [animator addBehavior:centerSpring];
    [animator addBehavior:collision];
    
    [centerSpring setLength:2];
    
    manager = [[CMMotionManager alloc] init];
    
    [manager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        
        grav.xComponent = accelerometerData.acceleration.x / 10;
        grav.yComponent = -accelerometerData.acceleration.y / 10;
        
    }];
    
    NSTimer *loop;
    loop = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(loop:) userInfo:nil repeats:YES];
}

-(void)loop:(NSTimer *)timer
{
    for (UIView *view in self.view.subviews)
    {
        for (UIView *subView in self.view.subviews)
        {
            if (view == subView) continue;
            
            float dist = [JCMath distanceBetweenPoint:view.frame.origin andPoint:subView.frame.origin sorting:NO];
            
            if (dist > 300) continue;
            
            float angle = [JCMath angleFromPoint:view.frame.origin toPoint:subView.frame.origin];
            
            CGPoint pushAmount = [JCMath pointFromPoint:CGPointZero pushedBy:-7 inDirection:angle];
            
            [childBehaviors addLinearVelocity:pushAmount forItem:view];
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView:self.view];
    
    float dist = FLT_MAX;
    
    for (UIView *view in self.view.subviews)
    {
        float testDist = sqrtf( powf(view.frame.origin.x - location.x, 2) + powf(view.frame.origin.y - location.y, 2) );
        
        if (testDist < dist)
        {
            dist = testDist;
        }
    }
}

-(void)dive:(UIButton *)sender
{
    [currentView setTitle:sender.titleLabel.text forState:UIControlStateNormal];
    
    for (UIButton *item in childViews)
    {
        [collision removeItem:item];
        [grav removeItem:item];
        
        [UIView animateWithDuration:1 animations:^{
            item.alpha = 0;
        } completion:^(BOOL finished) {
            [item removeFromSuperview];
        }];
    }
    
    for (__strong UIAttachmentBehavior *link in linksCollection)
    {
        [animator removeBehavior:link];
        link = nil;
    }
    
    [animator removeBehavior:childBehaviors];
    childBehaviors = nil;
    
    [childViews removeAllObjects];
    
    for (int i = 0; i<arc4random()%10 + 1; i++) {
        
        UIButton *child = [self buttonWithText:[NSString stringWithFormat:@"child %i", i] origin:CGPointMake(320/2 + arc4random()%100 - 50, 460/2 + arc4random()%100 - 50) size:20];
        
        [childViews addObject:child];
        
        [self.view addSubview:child];
        
        UIAttachmentBehavior *link = [[UIAttachmentBehavior alloc] initWithItem:child attachedToItem:currentView];
        [animator addBehavior:link];
        [linksCollection addObject:link];
        
        [grav addItem:child];
        [collision addItem:child];
        
        [link setLength:80 + arc4random()%80];
        [link setFrequency:4];
        [link setDamping:2];
        
        [child addTarget:self action:@selector(dive:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    childBehaviors = [[UIDynamicItemBehavior alloc] initWithItems:childViews];
    [childBehaviors setAllowsRotation:NO];
    [childBehaviors setResistance:2];
    [animator addBehavior:childBehaviors];
}

-(UIButton *)buttonWithText:(NSString *)text origin:(CGPoint)origin size:(int)size
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.tintColor = COLORA;
    [button setTitleColor:COLORA forState:UIControlStateNormal];
    
    
    [button setFrame:CGRectMake(origin.x, origin.y, size * 3, size)];
    [button setTitle:text forState:UIControlStateNormal];
    
    [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:size]];
    
    return button;
}

-(void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    NSLog(@"Pause");
}

-(void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator
{
    NSLog(@"Resumed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
