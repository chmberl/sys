//
//  ButtonListener.h
//  protocal协议
//
//  Created by 张博良 on 14/10/27.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Button.h"

@protocol ButtonDelegate;

@interface ButtonListener : NSObject <ButtonDelegate>

- (void)onclick:(Button *) btn;
@end
