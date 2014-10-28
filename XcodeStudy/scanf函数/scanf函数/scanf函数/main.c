//
//  main.c
//  scanf函数
//
//  Created by 张博良 on 14/10/26.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#include <stdio.h>

void test1();
void test2();

int main(int argc, const char * argv[]) {
    test2();
    return 0;
}

void test1() {
    // insert code here...
    printf("请输入一个整数：");
    
    int a;
    
    scanf("%d", &a);
    
    printf("%d的平方为：%d\n", a, a * a);
}

void test2() {
    // insert code here...
    printf("请输入两个整数（用空格隔开）:");
    
    int a, b;
    
    scanf("%d %d", &a, &b);
    
    printf("%d + %d = %d\n", a, b, a + b);
}