//
//  DateAndTimeViewController.m
//  StoryboardTest
//
//  Created by 张博良 on 15/4/25.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "DateAndTimeViewController.h"

@interface DateAndTimeViewController ()

@end

@implementation DateAndTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)viewWillAppear:(BOOL)animated {
    NSDate *now = [NSDate date];
    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:now dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle];
    self.timeLabel.text = [NSDateFormatter localizedStringFromDate:now dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
    
    
}


@end
























