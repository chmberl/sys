//
//  Student.h
//  OC的类程序
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

// @interface只是声明一个类
// : 代表继承

@interface Student : NSObject { // 成员变量要定义在下面的大括号中{}
    int age;
    int no;
}

// 在这里声明的方法都是公共方法
// age的get方法
// - 代表动态方法 + 代表静态方法
- (int) age;
// age的set方法
- (void) setAge:(int) newAge;

- (void) setAge:(int) newAge andNo:(int)newNo;
@end
