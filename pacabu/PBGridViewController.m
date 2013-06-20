//
//  PBGridViewController.m
//  pacabu
//
//  Created by Jon Como on 6/19/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBGridViewController.h"
#import "PBManager.h"

@interface PBGridViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UICollectionView *collectionViewGrid;
    
    NSMutableArray *cells;
}

@end

@implementation PBGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[PBManager sharedManager] activitiesOptions:@{@"cachePolicy" : @(kPFCachePolicyCacheElseNetwork)} completion:^(BOOL success, NSArray *objects) {
        if (!success) return;
        
        cells = [objects mutableCopy];
        [collectionViewGrid reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellImage" forIndexPath:indexPath];
    
    PFImageView *imageView = (PFImageView *)[cell viewWithTag:100];
    
    PFObject *object = cells[indexPath.row];
    
    NSArray *images = object[@"images"];
    
    if (images.count > 0)
    {
        [imageView setFile:images[0]];
        [imageView loadInBackground];
    }
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cells.count;
}

@end
