//
//  main.m
//  property语法
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Student+test.h"
#import "NSString+JSON.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *s = [[Student alloc] init];
        
        s.age = 23;
        s.height = 45.0;
        
        [s test];
        [s test2];
        [s test3];
        [NSString json];
        NSLog(@"age is %i \n height is %.1f", s.age, s.height);
    }
    return 0;
}
