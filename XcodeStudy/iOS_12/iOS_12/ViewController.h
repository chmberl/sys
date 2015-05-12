//
//  ViewController.h
//  iOS_12
//
//  Created by 张博良 on 15/4/20.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

- (IBAction)buttonPressed;//:(id)sender


@end

