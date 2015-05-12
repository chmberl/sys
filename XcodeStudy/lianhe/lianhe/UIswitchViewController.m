//
//  UIswitchViewController.m
//  lianhe
//
//  Created by 张博良 on 15/4/16.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIswitchViewController.h"

@interface UIswitchViewController ()

@end

@implementation UIswitchViewController


@synthesize leftSwitch, rightSwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    leftSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    rightSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 240, 40, 20)];
    [leftSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:leftSwitch];
    [rightSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:rightSwitch];
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *mySwitch = (UISwitch *) sender;
    BOOL setting = mySwitch.isOn;
    if(setting) {
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
    
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
