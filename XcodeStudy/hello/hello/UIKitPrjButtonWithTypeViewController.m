//
//  UIKitPrjButtonWithTypeViewController.m
//  hello
//
//  Created by 张博良 on 15/4/13.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjButtonWithTypeViewController.h"

static const CGFloat kRowHeight = 80;

@interface UIKitPrjButtonWithTypeViewController ()

- (UIButton *) buttonForThisSampleWithType:(UIButtonType) type;

@end

@implementation UIKitPrjButtonWithTypeViewController

- (UIButton *) buttonForThisSampleWithType:(UIButtonType)type {
    UIButton *button = [UIButton buttonWithType:type];
    [button setTitle:@"UIButton" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button sizeToFit];
    return button;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
