//
//  main.m
//  Button
//
//  Created by 张博良 on 15/4/8.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Button.h"

typedef int (^MySum) (int,int);


void test() {
    int (^ Sum)(int, int) = ^(int a, int b) {
        return a + b;
    };
    
    int a = Sum(10, 20);
    NSLog(@"%i", a);
    __block int c = 17;
    c = 20;
    MySum sum = ^(int a, int b) {
        c = 19;
        
        NSLog(@"%i", c);
        return a + b;
    };
    
    NSLog(@"%i", sum(40,20));

}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Button *btn = [[Button alloc] init];
        
        btn.block = ^(Button *btn) {
            NSLog(@"按钮－%@ 被点击了", btn);
        };
        
        [btn click];
    }
    return 0;
}
