//
//  main.m
//  NSStringTest
//
//  Created by 张博良 on 14/10/29.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

void stringCreate() {
    NSString *str1 = @"A string";
    NSString *str2 = [[NSString alloc] init];
    str2 = @"A string";
    
    NSString *str3 = @"A string";
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        stringCreate();
    }
    return 0;
}
