//
//  PBDiscoveryViewController.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBDiscoveryViewController.h"
#import "JCMultiView.h"

@interface PBDiscoveryViewController ()
{
    __weak IBOutlet JCMultiView *multiView;
}

@end

@implementation PBDiscoveryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    multiView.nibNames = @[@"ViewList", @"ViewMap"];
    [multiView setVisibleView:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeView:(UISegmentedControl *)sender {
    [multiView setVisibleView:sender.selectedSegmentIndex];
}

@end
