//
//  ViewController.m
//  TextPrint
//
//  Created by 张博良 on 14/11/17.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)btnClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *TextLabel;
@property (weak, nonatomic) IBOutlet UITextField *TextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(UIButton *)sender {
    NSString *str = self.TextField.text;
    self.TextLabel.text = [NSString stringWithFormat:@"'%@' is %lu charaters",str, (unsigned long)str.length];
}

@end
