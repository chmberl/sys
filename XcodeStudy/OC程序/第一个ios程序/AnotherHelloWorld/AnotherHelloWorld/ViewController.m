//
//  ViewController.m
//  AnotherHelloWorld
//
//  Created by 张博良 on 14/11/3.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doBtnHide:(id)sender {
    [sender setTitle:![_OutLab isHidden] ? @"Show" : @"Hide" forState:UIControlStateNormal];
    [_OutLab setHidden:![_OutLab isHidden]];
}

@end
