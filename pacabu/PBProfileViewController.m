//
//  PBProfileViewController.m
//  pacabu
//
//  Created by David de Jesus on 5/30/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBProfileViewController.h"
#import "PBPacabuDetailViewController.h"
#import <Parse/PF_MBProgressHUD.h>
#import <Parse/Parse.h>

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

- (IBAction)newPacabu:(id)sender
{
    PFObject *pacabu = [PFObject objectWithClassName:@"pacabu"];
    
    PBPacabuDetailViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"pacabuDetailsVC"];
    
    detailsVC.pacabu = pacabu;
    
    [self presentViewController:detailsVC animated:YES completion:nil];
}

- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
