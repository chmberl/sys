//
//  CalculateBrain.h
//  Calculater
//
//  Created by 张博良 on 14/11/3.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateBrain : NSObject

- (void) pushOperand:(double)operand;
- (double) performOperation:(NSString *) operation;

@property (readonly) id program;

+ (double) runProgram:(id) program;

+ (NSString *) descriptionOfProgram:(id)program;

@end
