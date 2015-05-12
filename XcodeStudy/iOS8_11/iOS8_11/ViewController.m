//
//  ViewController.m
//  iOS8_11
//
//  Created by 张博良 on 15/4/16.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize webView;
@synthesize activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"webview");
    //self.webView = [[UIWebView alloc] init];
    //webView.center = self.view.center;
    //webView.frame = CGRectMake(0, 0, 400, 400);
    //webView.backgroundColor = [UIColor whiteColor];
    //NSURL *appURL = [[NSURL alloc] initWithString:@"http://www.chmbel.com"];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:appURL]];
    //[self.view addSubview:webView];
    
    self.title = @"明确显示通信状态";
    self.webView = [[UIWebView  alloc] init];
    
    webView.frame = self.view.bounds;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    
    activityIndicator = [[UIActivityIndicatorView alloc] init];
    activityIndicator.frame = CGRectMake(0, 0, 20, 20);
    UIBarButtonItem *indicator = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    UIBarButtonItem *adjustment = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *buttons = [NSArray arrayWithObjects:adjustment, indicator, adjustment, nil];
    [self setToolbarItems:buttons animated:YES];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com"]];
    [webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
