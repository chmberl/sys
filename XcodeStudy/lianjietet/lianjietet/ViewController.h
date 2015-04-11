//
//  ViewController.h
//  lianjietet
//
//  Created by 张博良 on 15/4/10.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISegmentedControl *colorChoice;
@property (nonatomic, strong) IBOutlet UIWebView *flowerView;
@property (nonatomic, strong) IBOutlet UILabel *chosenColor;

- (IBAction) getFlower:(id)sender;

@end

