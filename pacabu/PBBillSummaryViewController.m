//
//  PBBillSummaryViewController.m
//  pacabu
//
//  Created by David de Jesus on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBBillSummaryViewController.h"
#import "PBHostDetailViewController.h"
#import "PBActivity.h"
#import "PBGraphics.h"

@interface PBBillSummaryViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *cells;
}

@end

@implementation PBBillSummaryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[PBGraphics darkTexture]];

}

- (void)callHost
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cells.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{


}

@end
