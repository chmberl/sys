//
//  ViewController.m
//  shoudian
//
//  Created by 张博良 on 15/4/27.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"
#define kOnOffToggle @"onOff"
#define kBrightnessLevel @"brightness"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toggleSwitch.on = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)setLightSourceAlphaValue{
    if (self.toggleSwitch.on) {
        self.lightSource.alpha = self.brightnessSlider.value;
        NSLog(@"%f", self.brightnessSlider.value);
        
    } else {
        self.lightSource.alpha = 0;
    }

}
@end
