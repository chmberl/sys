//
//  UIKitPrjEditableTextViewViewController.m
//  hello
//
//  Created by 张博良 on 15/4/12.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjEditableTextViewViewController.h"



@implementation UIKitPrjEditableTextViewViewController

@synthesize textView_;

- (void)viewDidLoad {
    [super viewDidLoad];
    textView_ = [[UITextView alloc] init];
    textView_.frame = self.view.bounds;
    textView_.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    textView_.delegate = self;
    textView_.text = @"亲们，可以编辑这段文字";
    [self.view addSubview:textView_];
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
