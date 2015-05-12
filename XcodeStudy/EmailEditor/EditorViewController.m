//
//  EditorViewController.m
//  EmailEditor
//
//  Created by 张博良 on 15/4/25.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "EditorViewController.h"

@implementation EditorViewController

- (void)viewDidLoad {
//.emailLabel.text);
    self.emailField.text = ((ViewController *) self.presentingViewController).emailLabel.text;
    [super viewDidLoad];

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

- (IBAction)dismissEditor:(id)sender {
    ((ViewController *) self.presentingViewController).emailLabel.text = self.emailField.text;
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end
