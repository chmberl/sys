//
//  Student.m
//  OC的类程序
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "Student.h"

@implementation Student

- (int)age {
    NSLog(@"调用了getAge方法");
    return age;
}

- (void)setAge:(int)newAge {
    age = newAge;
    NSLog(@"调用了setAge方法");
}

- (void)setAge:(int)newAge andNo:(int)newNo {
    age = newAge;
    no = newNo;
}

@end
