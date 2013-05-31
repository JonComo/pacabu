//
//  PBCalendarViewController.m
//  pacabu
//
//  Created by David de Jesus on 5/30/13.
//  Copyright (c) 2013 DKJ. All rights reserved.
//

#import "PBCalendarViewController.h"
#import "TSQCalendarView.h"

@interface PBCalendarViewController () <TSQCalendarViewDelegate>
{
    TSQCalendarView *calendar;
}

@end

@implementation PBCalendarViewController

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
    
    calendar = [[TSQCalendarView alloc] initWithFrame:self.view.frame];
    
    self.view = calendar;
    
    calendar.delegate = self;
    
    [calendar setFirstDate:[NSDate date]];
    [calendar setLastDate:[NSDate dateWithTimeInterval:60 * 60 * 96 sinceDate:[NSDate date]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calendarView:(TSQCalendarView *)calendarView didSelectDate:(NSDate *)date
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
