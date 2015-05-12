//
//  ViewController.h
//  iOS_14_2
//
//  Created by 张博良 on 15/4/21.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *redFlowers;
@property (nonatomic, strong) NSArray *blueFlowers;

@end

