//
//  main.m
//  blocktest
//
//  Created by 张博良 on 14/10/28.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Button.h"

typedef int (^MySum) (int, int);


void test() {
    int (^Sum) (int, int) = ^(int a, int b) {
        return a + b;
    };
    
    int a = Sum(10,11);
    
    NSLog(@"%i", a);

}

void test2(){
    __block int c = 18;
    MySum sum = ^(int a, int b) {
        c = 19;
        NSLog(@"c is %i", c);
        return a + b;
    };
    
    NSLog(@"%i", sum(10,10));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Button * btn = [[Button alloc] init];
        
        btn.block = ^(Button * btn) {
            NSLog(@"%@ 按钮被点击了", btn);
        };
        
        [btn click];
    
    }
    return 0;
}
