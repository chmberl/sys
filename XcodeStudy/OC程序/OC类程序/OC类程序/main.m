//
//  main.m
//  OC类程序
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        Person * person = [[Person alloc] init];
//        
//        person.age = 10;
//        int a = person.age;
        
        
        Person * p = [[Person alloc] initWithAge:23 andNo:443];
        NSLog(@"age is %d, no is %d", p.age, p.no);
        // %@是代表打印一个对象
        NSLog(@"%@", p);
    }
    return 0;
}
