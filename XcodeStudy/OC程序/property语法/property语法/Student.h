//
//  Student.h
//  property语法
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property int age;
@property int no;
@property float height;


- (void) test;
@end

@interface Student (Addition)

- (void) test3;
@end
