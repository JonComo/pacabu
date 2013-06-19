//
//  PBActivityCell.h
//  pacabu
//
//  Created by Jon Como on 6/2/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBCell.h"
#import <Parse/Parse.h>

@class PBActivity;

@interface PBActivityCell : PBCell

@property (nonatomic, weak) PFObject *object;
@property (weak, nonatomic) IBOutlet PFImageView *imageViewBackground;

@end