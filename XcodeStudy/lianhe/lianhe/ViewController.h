//
//  ViewController.h
//  lianhe
//
//  Created by 张博良 on 15/4/13.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *thePlace;
@property (strong, nonatomic) IBOutlet UITextField *theVerb;
@property (strong, nonatomic) IBOutlet UITextField *theNumber;
@property (strong, nonatomic) IBOutlet UITextView *theTemplate;
@property (strong, nonatomic) IBOutlet UITextView *theStory;
@property (strong, nonatomic) IBOutlet UIButton *theButton;

- (IBAction)createStory:(id)sender;
- (IBAction)hideKeyBoard:(id)sender;

@end

