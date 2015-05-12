//
//  EditorViewController.h
//  EmailEditor
//
//  Created by 张博良 on 15/4/25.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)dismissEditor:(id)sender;

@end
