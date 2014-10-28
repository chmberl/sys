//
//  Person.h
//  OC类程序
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    int _age;
    int _no;
}

- (void) setNo:(int) no;

- (int) no;

- (void) setAge:(int) newAge;//方法名是setAge:

- (int) age;//方法名是age

- (id) initWithAge:(int) age andNo:(int) no;

- (NSString *) description;

@end
