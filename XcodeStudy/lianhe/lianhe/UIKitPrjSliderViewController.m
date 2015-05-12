//
//  UIKitPrjSliderViewController.m
//  lianhe
//
//  Created by 张博良 on 15/4/14.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKitPrjSliderViewController.h"

@interface UIKitPrjSliderViewController ()

@end

@implementation UIKitPrjSliderViewController

@synthesize label_;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    label_ = [[UILabel alloc] init];
    label_.frame = self.view.bounds;
    label_.font = [UIFont boldSystemFontOfSize:36];
    [label_ setTextAlignment:NSTextAlignmentCenter];
    label_.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    label_.text = @"0.5";
    [self.view addSubview:label_];
    
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = CGRectMake(0, 0, 250, 50);
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    slider.center = self.view.center;
    [slider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
}

- (void) sliderDidChange:(id) sender{
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider = sender;
        label_.text = [NSString stringWithFormat:@"%0.1f", slider.value];
    }
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
