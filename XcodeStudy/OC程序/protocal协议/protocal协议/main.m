//
//  main.m
//  protocal协议
//
//  Created by 张博良 on 14/10/27.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Button.h"
#import "ButtonListener.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Button * button = [[Button alloc] init];
        
        ButtonListener * listener = [[ButtonListener alloc] init];
        
        button.delegate = listener;
        
        [button click];
        
    }
    return 0;
}
