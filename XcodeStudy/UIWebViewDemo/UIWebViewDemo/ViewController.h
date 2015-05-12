//
//  ViewController.h
//  UIWebViewDemo
//
//  Created by 张博良 on 15/4/27.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>


@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *button;
- (IBAction)buttonPressed:(id)sender;
- (void) loadWebPageWithString: (NSString *) urlString;

@end

