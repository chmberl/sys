//
//  CalculateBrain.m
//  Calculater
//
//  Created by 张博良 on 14/11/3.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "CalculateBrain.h"

@interface CalculateBrain()

@property (nonatomic, strong) NSMutableArray *programStack;
@property  (nonatomic,strong) NSString * operator;

@end

@implementation CalculateBrain

@synthesize programStack = _programStack;
@synthesize operator = _operator;

- (void) setProgramStack:(NSMutableArray *)programStack {
    
}

- (NSMutableArray *)programStack {
    if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

- (NSString *) operator {
    return _operator;
}

- (void)pushOperand:(double)operand {
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    
}

- (id) program {
    return [self.programStack copy];
}

+ (NSString *) descriptionOfProgram:(id)program {
    return @"Implement in this Assignment 2";
}

+ (double) popOperandOfStack:(NSMutableArray *) stack{
    double result = 0;
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]] ) {
        result = [topOfStack doubleValue];
    } else if ([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operator = topOfStack;
        if ( [operator isEqualToString:@"+"]){
            result  = [self popOperandOfStack:stack] + [self popOperandOfStack:stack];
        } else if ([operator isEqualToString:@"-"]){
            result  = -[self popOperandOfStack:stack] + [self popOperandOfStack:stack];
        } else if ([operator isEqualToString:@"*"]) {
            result  = [self popOperandOfStack:stack] * [self popOperandOfStack:stack];
        } else if ([operator isEqualToString:@"/"] ){
            double divor = [self popOperandOfStack:stack];
            if (divor) {
                result  = [self popOperandOfStack:stack] / divor;
            }
        }

    }
    return result;
}

+ (double)runProgram:(id)program {
    NSMutableArray *stack;
    
    if ([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperandOfStack:stack];
}

- (double) performOperation:(NSString *)operation {
    [self.programStack addObject:operation];
    return [CalculateBrain runProgram:self.program];
    
}

@end
