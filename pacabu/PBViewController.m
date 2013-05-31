//
//  PBViewController.m
//  pacabu
//
//  Created by David de Jesus on 5/30/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBViewController.h"
#import <Parse/Parse.h>

@interface PBViewController ()
{
    
    IBOutlet UIView *viewContent;
}

@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.145 blue:0.572 alpha:1.000];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeView:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    
    [UIView transitionWithView:viewContent duration:0.3 options:UIViewAnimationOptionTransitionNone animations:^{
        viewContent.backgroundColor = viewContent.backgroundColor == [UIColor whiteColor] ? [UIColor orangeColor] : [UIColor whiteColor];
    } completion:nil];
}


@end