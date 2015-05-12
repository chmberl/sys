//
//  ViewController.m
//  UIWebViewDemo
//
//  Created by 张博良 on 15/4/27.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize textField;
@synthesize button;
@synthesize webView;
@synthesize activityIndicatorView;


- (void)viewDidLoad {
    [super viewDidLoad];
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [self.activityIndicatorView setCenter:self.view.center];
    [self.activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.webView addSubview:self.activityIndicatorView];
    [self buttonPressed:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    [textField resignFirstResponder];
    [self loadWebPageWithString:textField.text];
    if (sender == button) {
        textField.hidden = YES;
        button.hidden = YES;
    }
}

- (void) loadWebPageWithString:(NSString *)urlString
{
    if (self.textField.text != nil) {
        urlString = [@"http://" stringByAppendingString:urlString];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        
    }
}

- (void) webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicatorView startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicatorView stopAnimating];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (!self.button) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
























