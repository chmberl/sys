//
//  Student.m
//  property语法
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "Student.h"

@implementation Student

//可以省略@synthesize
@synthesize age = _age, no = _no, height = _height;


- (void)test {
    NSLog(@"test方法");
}
@end

@implementation Student (Addition)

- (void)test3 {
    NSLog(@"test3方法");
}

@end
