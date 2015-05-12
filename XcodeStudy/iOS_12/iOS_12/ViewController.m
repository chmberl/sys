//
//  ViewController.m
//  iOS_12
//
//  Created by 张博良 on 15/4/20.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doActionSheel:nil];
    //[alert release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择一个按钮：" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"按钮1", @"按钮2", @"按钮3", nil];
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *msg = [[NSString alloc] initWithFormat:@"您按下的是第%ld个按钮", buttonIndex];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    //[msg release];
}

- (void) willPresentAlertView:(UIAlertView *)alertView {

    CGRect frame = alertView.frame;
    frame.origin.y  -=120;
    frame.size.height +=80;
    alertView.frame = frame;
    
    for (UIView *view in alertView.subviews) {
        if ( ![view isKindOfClass:[UILabel class]]) {
            CGRect btnFrame = view.frame;
            btnFrame.origin.y += 70;
            view.frame = btnFrame;
            
        }
    }
    
    UITextField *accountName = [[UITextField alloc] init];
    UITextField *accountPassword = [[UITextField alloc] init];
    
    accountName.frame = CGRectMake(10, frame.origin.y + 40, frame.size.width - 20, 30);
    accountPassword.frame = CGRectMake(10, frame.origin.y + 80, frame.size.width - 20, 30);
    
    accountName.placeholder = @"请输入账号";
    accountPassword.placeholder = @"请输入密码";
    accountPassword.secureTextEntry = YES;
    
    [alertView addSubview:accountPassword];
    [alertView addSubview:accountName];
}

- (IBAction)doActionSheel:(id)sender {
    UIActionSheet *actionSheet;
    actionSheet = [ [UIActionSheet alloc] initWithTitle:@"Available" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"keep", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}


@end














