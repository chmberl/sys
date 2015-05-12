//
//  ViewController.h
//  shoudian
//
//  Created by 张博良 on 15/4/27.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *toggleSwitch;

@property (strong, nonatomic) IBOutlet UISlider *brightnessSlider;

@property (strong, nonatomic) IBOutlet UIView *lightSource;


- (IBAction)setLightSourceAlphaValue;

@end

