//
//  PBActivityDetailViewController.m
//  pacabu
//
//  Created by David de Jesus on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBActivityDetailViewController.h"
#import "PBBillSummaryViewController.h"
#import "PBActivity.h"

@interface PBActivityDetailViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UIButton *bookButton;
    
}

@end

@implementation PBActivityDetailViewController

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
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Blah" style:UIBarButtonItemStylePlain target:self action:@selector(shareActivity)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    
}

- (void)shareActivity
{
    
}

- (IBAction)book:(id)sender
{
    UIStoryboard *secondSB = [UIStoryboard storyboardWithName:@"SecondaryStoryboard" bundle:[NSBundle mainBundle]];
    PBBillSummaryViewController *billVC = [secondSB instantiateViewControllerWithIdentifier:@"SummaryVC"];
    billVC.activity = self.activity;
    [self.navigationController pushViewController:billVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
