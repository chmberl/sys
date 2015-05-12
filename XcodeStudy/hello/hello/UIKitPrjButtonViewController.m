//
//  UIKitPrjButtonViewController.m
//  hello
//
//  Created by 张博良 on 15/4/13.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjButtonViewController.h"

@interface UIKitPrjButtonViewController ()

@end

@implementation UIKitPrjButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"危险！请勿点击" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    button.center = self.view.center;
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:button];
}

- (void) buttonDidPush {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.message = @"哈哈，这是一个玩笑";
    [alert addButtonWithTitle:@"ok"];
    [alert addButtonWithTitle:@"canel"];
    [alert show];
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
