//
//  PBActivity.m
//  pacabu
//
//  Created by Jon Como on 6/1/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBActivity.h"
#import "PBParseManager.h"

@implementation PBActivity

@synthesize images = _images;

+(PBActivity *)new
{
    PBActivity *newActivity = [[self alloc] initWithClassName:@"Activity"];
    
    if ([PFUser currentUser])
        [newActivity setObject:[PFUser currentUser] forKey:@"user"];
    
    return newActivity;
}

-(void)saveCompletion:(void (^)(BOOL success))block
{
    __block int numToUpload = self.images.count;
    
    for (UIImage *image in self.images)
    {
        PFFile *imageFile = [PFFile fileWithData:UIImageJPEGRepresentation(image, 0.7)];
        
        [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            numToUpload --;
            
            [self addObject:imageFile forKey:@"images"];
            
            if (numToUpload == 0)
            {
                [[PBParseManager sharedManager] saveObject:self completion:block];
            }
            
        }];
    }
}

@end