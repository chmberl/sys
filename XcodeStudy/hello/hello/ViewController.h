//
//  ViewController.h
//  hello
//
//  Created by 张博良 on 15/4/12.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKitPrjChangeColorAndFontViewController.h"
#import "UIKitPrjTextViewViewController.h"
#import "UIKitPrjEditableTextViewViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *userOutput;
@property (strong, nonatomic) IBOutlet UITextField *userInput;


- (IBAction)setOutput:(id)sender;

@end

