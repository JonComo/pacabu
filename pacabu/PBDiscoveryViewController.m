//
//  PBDiscoveryViewController.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBDiscoveryViewController.h"
#import "PBCell.h"

@interface PBDiscoveryViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
{
    __weak IBOutlet UICollectionView *collectionViewDiscover;
}

@end

@implementation PBDiscoveryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [collectionViewDiscover registerNib:[UINib nibWithNibName:@"CellActivity" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CellActivity"];
    
    [collectionViewDiscover registerNib:[UINib nibWithNibName:@"CellMap" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CellMap"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = indexPath.row == 0 ? @"CellMap" : @"CellActivity";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PBCell *cell = (PBCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell detailViewController];
}

@end
