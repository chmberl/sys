//
//  Person.m
//  OC类程序
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)newAge {
    _age = newAge;
}

- (int) age {
    return _age;
}

- (int) no {
    return _no;
}

- (void) setNo:(int)no{
    _no = no;
}

- (id)initWithAge:(int)age andNo:(int)no {
    self = [super init];
    
    if (self != nil) {
        _age = age;
        _no = no;
    }
    
    return self;
}
// 如果没有在头文件中声明的方法，就是私有方法

- (NSString *)description {
    return [NSString stringWithFormat:@"age is %i no is %i", _age, _no];
}

@end
