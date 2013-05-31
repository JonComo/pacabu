//
//  PBAccountViewController.m
//  pacabu
//
//  Created by David de Jesus on 5/30/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBAccountViewController.h"
#import <Parse/Parse.h>

@interface PBAccountViewController () <PFSignUpViewControllerDelegate, PFLogInViewControllerDelegate>
{
    IBOutlet UILabel *labelUser;
}

@end

@implementation PBAccountViewController

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
    
    labelUser.text = [PFUser currentUser].username;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createAccount:(id)sender
{
    PFSignUpViewController *signUp = [[PFSignUpViewController alloc] init];
    
    signUp.delegate = self;
    
    [self presentViewController:signUp animated:YES completion:nil];
}

- (IBAction)signIn:(id)sender
{
    PFLogInViewController *logIn = [[PFLogInViewController alloc] init];
    
    logIn.delegate = self;
    
    [self presentViewController:logIn animated:YES completion:nil];
}

- (IBAction)signOut:(id)sender
{
    [PFUser logOut];
}

- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error
{
    
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [signUpController dismissViewControllerAnimated:YES completion:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

-(void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
{
    
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [logInController dismissViewControllerAnimated:YES completion:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
