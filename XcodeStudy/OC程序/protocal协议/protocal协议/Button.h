//
//  Button.h
//  protocal协议
//
//  Created by 张博良 on 14/10/27.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Button;

// <>代表实现某个协议
@protocol ButtonDelegate  <NSObject>

- (void) onclick:(Button *)btn;

@end

@interface Button : NSObject

@property (nonatomic, retain) id<ButtonDelegate> delegate;

-(NSString *)description;
- (void) click;

@end
