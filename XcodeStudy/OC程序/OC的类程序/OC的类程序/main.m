//
//  main.m
//  OC的类程序
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个Student对象
        
        // 1、 调用静态方法alloc来分配内存
        // 2、 调用动态方法init进行初始化
        Student* s = [[Student alloc] init];
        // s = [s init];
        
        [s setAge:23];
        NSLog(@"age is %i", [s age]);
        
    }
    return 0;
}
