//
//  UIKiPrjUIImageViewController.m
//  lianhe
//
//  Created by 张博良 on 15/4/16.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "UIKiPrjUIImageViewController.h"

@interface UIKiPrjUIImageViewController ()

@end

@implementation UIKiPrjUIImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"dog.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = self.view.center;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    CGFloat x = 100;
    imageView.transform = CGAffineTransformMakeTranslation(x, x);
    
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    [imageView addGestureRecognizer:singleTap];
    [self.view addSubview:imageView];
}


- (void) tapImageView:(id) sender {
    NSLog(@"imageView");
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
