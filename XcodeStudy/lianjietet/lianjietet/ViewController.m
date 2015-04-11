//
//  ViewController.m
//  lianjietet
//
//  Created by 张博良 on 15/4/10.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController


@synthesize chosenColor;
@synthesize colorChoice;
@synthesize flowerView;


- (IBAction)getFlower:(id)sender {
    NSString *outputHTML;
    NSString *color;
    NSString *colorVal;
    int colorNum;
//    colorNum = colorChoice.selectedSegmentIndex;
//    switch (colorNum) {
//        case 0:
//            color = @"Red";
//            colorVal = @"red";
//            break;
//        case 1:
//            color = @"Green";
//            colorVal = @"green";
//            break;
//        case 2:
//            color = @"Blue";
//            colorVal = @"blue";
//            break;
//        case 3:
//            color = @"Yellow";
//            colorVal = @"yellow";
//            break;
//        default:
//            break;
//    }
    
//    chosenColor.text = [[NSString alloc] initWithFormat:@"%@", color];
//    outputHTML = [[NSString alloc] initWithFormat:@"<body style='margin: 0px; padding:0px'><img height='1200' src='http://www.floraphotographs.com/showrandom.php?color=%@'></body>",colorVal];
//    NSLog(@"%@", outputHTML);
    //[flowerView loadHTMLString:outputHTML baseURL:nil];
    NSURL * htmlUrl = [NSURL URLWithString:@"http://www.chmbel.com"];
    NSString *content = [NSString stringWithContentsOfURL:htmlUrl encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", content);
    [flowerView loadHTMLString:content baseURL:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
