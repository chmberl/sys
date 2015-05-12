//
//  UIKitPrjSimpleViewController.m
//  hello
//
//  Created by 张博良 on 15/4/13.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjSimpleViewController.h"

@interface UIKitPrjSimpleViewController ()

@end

@implementation UIKitPrjSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.frame = self.view.bounds;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.text = @"good";
    [label setTextAlignment:NSTextAlignmentCenter];
    
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Zapfino" size:48];
    [self.view addSubview:label];
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
