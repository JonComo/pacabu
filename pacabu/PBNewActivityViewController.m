//
//  PBNewActivityViewController.m
//  pacabu
//
//  Created by Jon Como on 6/18/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBNewActivityViewController.h"
#import "PBActivity.h"

@interface PBNewActivityViewController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate>

@end

@implementation PBNewActivityViewController
{
    NSMutableArray *eventImages;
    __weak IBOutlet UITableView *tableViewEvent;
    
    NSString *eventName;
    NSString *startDate;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    eventImages = [@[[UIImage imageNamed:@"pack1.jpg"], [UIImage imageNamed:@"pack2.jpg"], [UIImage imageNamed:@"pack3.jpg"]] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)deleteImage:(UISwipeGestureRecognizer *)swipe
{
    UICollectionViewCell *cell = (UICollectionViewCell *)swipe.view;
    UICollectionView *collectionView = (UICollectionView *)cell.superview;
    
    NSIndexPath *path = [collectionView indexPathForCell:cell];
    
    [UIView animateWithDuration:0.3 animations:^{
        cell.transform = CGAffineTransformMakeTranslation(400, 20);
        cell.alpha = 0;
    } completion:^(BOOL finished) {
        
        [eventImages removeObjectAtIndex:path.row];
        
        [collectionView performBatchUpdates:^{
            [collectionView deleteItemsAtIndexPaths:@[path]];
        } completion:^(BOOL finished) {
            [tableViewEvent reloadData];
        }];
    }];
}

-(void)updateTableHeight
{
    [tableViewEvent reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)text:(NSString *)text forTableViewCell:(UITableViewCell *)cell
{
    UITextField *textField = (UITextField *)[cell viewWithTag:100];
    textField.placeholder = text;
}

- (IBAction)launch:(id)sender
{
    PBActivity *activity = [PBActivity new];
    
    activity.images = [eventImages copy];
    
    if (eventName)
        [activity setObject:eventName forKey:@"name"];
    if (startDate)
        [activity setObject:startDate forKey:@"startDate"];
    
    [activity saveCompletion:^(BOOL success) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSIndexPath *path = [tableViewEvent indexPathForRowAtPoint:[textField convertPoint:CGPointZero toView:tableViewEvent]];
    
    switch (path.row) {
        case 1:
            eventName = textField.text;
            break;
            
        case 2:
            startDate = textField.text;
            break;
            
        default:
            break;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.row) {
        case 0:
            //Image cell
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellImage"];
            break;
            
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellTextfield"];
            break;
    }
    
    switch (indexPath.row) {
        case 1:
            [self text:@"Activity Name" forTableViewCell:cell];
            break;
            
        case 2:
            [self text:@"Start Date" forTableViewCell:cell];
            break;
            
        case 3:
            [self text:@"End Date" forTableViewCell:cell];
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 43;
    
    switch (indexPath.row) {
        case 0:
            height = [self heightForImages];
            break;
            
        default:
            break;
    }
    
    return height;
}

-(float)heightForImages
{
    return 110 + (eventImages.count) / 3 * 110;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    
    if (indexPath.row == eventImages.count)
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellAdd" forIndexPath:indexPath];
        
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellImage" forIndexPath:indexPath];
        
        if (cell.gestureRecognizers.count == 0)
        {
            UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(deleteImage:)];
            [cell addGestureRecognizer:swipe];
        }
        
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
        
        [imageView setImage:eventImages[indexPath.row]];
    }
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return eventImages.count + 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == eventImages.count)
    {
        //Add iamge
        
        [eventImages addObject:[UIImage imageNamed:@"pack1.jpg"]];
        
        [collectionView performBatchUpdates:^{
            [collectionView insertItemsAtIndexPaths:@[indexPath]];
        } completion:^(BOOL finished) {
            [tableViewEvent reloadData];
        }];
    }
}

@end
