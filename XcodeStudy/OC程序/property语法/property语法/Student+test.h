//
//  Student+test.h
//  property语法
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "Student.h"


// ()代表是一个分类category
// ()中的test代表分类的名称
@interface Student (test)
//分类只能扩展方法，不能增加成员变量

- (void) test2;

@end
