//
//  ViewController.m
//  lianhe
//
//  Created by 张博良 on 15/4/13.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"
#import "UIKitPrjSliderViewController.h"
#import "UIKiPrjUIImageViewController.h"
#import "UIswitchViewController.h"
#import "UISegmentedControlViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize theButton;
@synthesize theNumber;
@synthesize thePlace;
@synthesize theStory;
@synthesize theTemplate;
@synthesize theVerb;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createStory:(id)sender {
    [self presentViewController:[[UISegmentedControlViewController alloc] init] animated:NO completion:nil];
}

- (IBAction)hideKeyBoard:(id)sender {
    [self.theVerb resignFirstResponder];
    [self.theTemplate resignFirstResponder];
    [self.thePlace resignFirstResponder];
    [self.theNumber resignFirstResponder];
}


@end
