//
//  ViewController.m
//  hello
//
//  Created by 张博良 on 15/4/12.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"
#import "UIKitPrjPlaceholder.h"
#import "UIkitPrjSimpleViewController.h"
#import "UIKitPrjBackgroundViewController.h"
#import "UIKitPrjSimpleViewController.h"
#import "UIKitPrjButtonViewController.h"

@implementation ViewController


@synthesize userOutput;
@synthesize userInput;

- (void)setOutput:(id)sender {
 
    self.userOutput.text = self.userInput.text;
    UIViewController *control = [[UIKitPrjButtonViewController alloc] init];
    [self presentViewController:control animated:NO completion:^(void) {
        NSLog(@"%@", @"跳转成功");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[userInput becomeFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
