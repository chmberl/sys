//
//  Button.m
//  Button
//
//  Created by 张博良 on 15/4/8.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "Button.h"

@implementation Button

- (void)click {
    _block(self);
}

-(NSString *)description {
        return @"按钮1";
}

@end
