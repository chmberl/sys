//
//  UISegmentedControlViewController.m
//  lianhe
//
//  Created by 张博良 on 15/4/16.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UISegmentedControlViewController.h"

@interface UISegmentedControlViewController ()

@end

@implementation UISegmentedControlViewController

- (void) selected:(id) sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            NSLog(@"zero");
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            NSLog(@"default");
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UISegmentedControl *mySegmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
    UIColor *myTint = [[UIColor alloc] initWithRed:0.66 green:0.77 blue:0.77 alpha:1.0];
    mySegmentedControl.tintColor = myTint;
    mySegmentedControl.momentary = NO;
    mySegmentedControl.center = self.view.center;
    [mySegmentedControl insertSegmentWithTitle:@"First" atIndex:0 animated:YES];
    [mySegmentedControl insertSegmentWithTitle:@"second" atIndex:2 animated:YES];
    [mySegmentedControl insertSegmentWithTitle:@"third" atIndex:3 animated:YES];
    
    [mySegmentedControl addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = mySegmentedControl;
    
    [self.view addSubview:mySegmentedControl];
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
