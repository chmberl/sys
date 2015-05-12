//
//  UIKitPrjBackgroundViewController.m
//  hello
//
//  Created by 张博良 on 15/4/12.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjBackgroundViewController.h"

@interface UIKitPrjBackgroundViewController ()

@end

@implementation UIKitPrjBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *imageWhitePaper = [UIImage imageNamed:@"paper.png"];
    UIImage *stretchableWhitePaper = [imageWhitePaper stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    UIImage *imageGrayPaper = [UIImage imageNamed:@"paperGray.png"];
    UIImage *stretchableGrayPaper = [imageGrayPaper stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    
    UITextField *textField = [[UITextField alloc] init];
    //[textField becomeFirstResponder];
    textField.frame = CGRectMake(20, 100, 280, 50);
    textField.background = stretchableWhitePaper;
    textField.disabledBackground = stretchableGrayPaper;
    textField.text = @"有图片";
    [textField setTextAlignment:NSTextAlignmentCenter];
    textField.contentVerticalAlignment =UIControlContentHorizontalAlignmentCenter;
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
