//
//  Button.m
//  protocal协议
//
//  Created by 张博良 on 14/10/27.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "Button.h"

@implementation Button

- (void) click{
    [_delegate onclick:self];
}

- (void)dealloc {
    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"dhsdkf"];
}

@end
