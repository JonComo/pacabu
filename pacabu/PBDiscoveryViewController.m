//
//  PBDiscoveryViewController.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBDiscoveryViewController.h"
#import "PBManager.h"
#import "PBCell.h"
#import "PBGraphics.h"
#import "PBActivityCell.h"
#import "PBActivity.h"
#import "PBTreeViewController.h"

@interface PBDiscoveryViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
{
    __weak IBOutlet UICollectionView *collectionViewDiscover;
    
    NSMutableArray *cells;
    
    UIRefreshControl *refresh;
}

@end

@implementation PBDiscoveryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [collectionViewDiscover registerNib:[UINib nibWithNibName:@"CellActivity" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CellActivity"];
    
    [collectionViewDiscover registerNib:[UINib nibWithNibName:@"CellMap" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CellMap"];
    
    refresh = [[UIRefreshControl alloc] init];
    
    [refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    [collectionViewDiscover addSubview:refresh];
    
    [self findActivitiesCachePolicyCache:YES];
}

- (IBAction)loadTree:(id)sender
{
    UIStoryboard *dynamicSB = [UIStoryboard storyboardWithName:@"Dynamics" bundle:[NSBundle mainBundle]];
    
    PBTreeViewController *tree = [dynamicSB instantiateViewControllerWithIdentifier:@"dynamicsVC"];
    
    [self.navigationController pushViewController:tree animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)findActivitiesCachePolicyCache:(BOOL)cache
{
    [[PBManager sharedManager] activitiesOptions:@{@"cachePolicy" : cache ? @(kPFCachePolicyCacheElseNetwork) : @(kPFCachePolicyNetworkElseCache)} completion:^(BOOL success, NSArray *objects) {
        
        [refresh endRefreshing];
        
        if (!success) return;
        
        cells = [objects mutableCopy];
        [collectionViewDiscover reloadData];
    }];
}

-(void)refresh:(UIRefreshControl *)control
{
    [self findActivitiesCachePolicyCache:NO];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellActivity";
    
    PFObject *object = cells[indexPath.row];
    
    PBActivityCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.object = object;
    [cell setup];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cells.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PBActivityCell *cell = (PBActivityCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [self.navigationController pushViewController:[cell detailViewController] animated:YES];
}

@end
