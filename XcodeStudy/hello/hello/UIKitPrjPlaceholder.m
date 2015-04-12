//
//  UIKitPrjPlaceholder.m
//  hello
//
//  Created by 张博良 on 15/4/12.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjPlaceholder.h"

@implementation UIKitPrjPlaceholder

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(20,100, 280, 30);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.placeholder = @"请输入信息";
    [self.view addSubview:textField];
    
}
@end
