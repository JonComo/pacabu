//
//  PBListView.m
//  pacabu
//
//  Created by Jon Como on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBListView.h"

@interface PBListView () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation PBListView
{
    __weak IBOutlet UICollectionView *collectionViewList;
}

-(id)init
{
    if (self = [super init]) {
        //init
        [self setup];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        //init
        
        [self setup];
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setup];
        
    }
    return self;
}

-(void)setup
{
    [collectionViewList registerClass:[PBListView class] forCellWithReuseIdentifier:@"CellActivity"];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionViewList dequeueReusableCellWithReuseIdentifier:@"CellActivity" forIndexPath:indexPath];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 35;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
