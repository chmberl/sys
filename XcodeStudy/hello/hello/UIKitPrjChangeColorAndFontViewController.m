//
//  UIKitPrjChangeColorAndFontViewController.m
//  hello
//
//  Created by 张博良 on 15/4/12.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjChangeColorAndFontViewController.h"

@interface UIKitPrjChangeColorAndFontViewController ()

@end

@implementation UIKitPrjChangeColorAndFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(20, 100, 280, 50);
    textField.borderStyle  = UITextBorderStyleBezel;
    textField.backgroundColor = [UIColor blackColor];
    textField.textColor = [UIColor redColor];
    textField.font  = [UIFont systemFontOfSize:36];
    
    textField.text = @"看我的字体和颜色";
    [self.view addSubview:textField];
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
