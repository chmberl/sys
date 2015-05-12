//
//  SegmentedControlTestViewController.m
//  lianhe
//
//  Created by 张博良 on 15/4/16.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "SegmentedControlTestViewController.h"

@interface SegmentedControlTestViewController ()

@end

@implementation SegmentedControlTestViewController


@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *segmentedArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4", nil];
    UISegmentedControl *segmentedTemp =[[UISegmentedControl alloc] initWithItems:segmentedArray];
    segmentedControl = segmentedTemp;
    segmentedControl.frame = CGRectMake(60.0, 9.0, 200.0, 50.0);
    
    [segmentedControl setTitle:@"two" forSegmentAtIndex:1];
    [segmentedControl setImage:[UIImage imageNamed:@"lan.png"] forSegmentAtIndex:3];
    
    [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"mei.png"] atIndex:2 animated:NO];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
