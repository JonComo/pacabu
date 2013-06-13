//
//  PBProfileViewController.m
//  pacabu
//
//  Created by David de Jesus on 5/30/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBProfileViewController.h"
#import "PBActivity.h"

@interface PBProfileViewController ()

@end

@implementation PBProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)new:(id)sender
{
    PBActivity *newActivity = [PBActivity new];
    [newActivity addObject:@"" forKey:@"description"];
    [newActivity addObject:@"" forKey:@"title"];
    [newActivity addObject:@"" forKey:@"dates"];
    [newActivity addObject:@"" forKey:@"slots"];
    [newActivity addObject:@"" forKey:@"donation"];
    [newActivity addObject:@"" forKey:@"location"];
    
    
    [newActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"Saved");
    }];
}

@end
