//
//  ViewController.m
//  blog
//
//  Created by 张博良 on 15/4/11.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController


@synthesize blogView;


- (void) blog {
    
    NSURL *url = [NSURL URLWithString:@"http://www.chmbel.com"];
    NSString *outputHTML = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    [blogView loadHTMLString:outputHTML baseURL:nil];
}

- (void)viewDidLoad {
    [self blog];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
