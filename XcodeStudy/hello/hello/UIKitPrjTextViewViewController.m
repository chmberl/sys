//
//  UIKitPrjTextViewViewController.m
//  hello
//
//  Created by 张博良 on 15/4/12.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjTextViewViewController.h"

@interface UIKitPrjTextViewViewController ()

@end

@implementation UIKitPrjTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = self.view.bounds;
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:32];
    textView.text = @"学习UITextView!\n"
                    "第2行\n"
                    "第3行\n"
                    "第4行\n"
                    "第5行\n"
                    "第6行\n"
                    "第7行\n"
                    "第8行\n"
                    "第9行\n"
                    "第10行\n";
    [self.view addSubview:textView];
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
