//
//  ViewController.m
//  Calculater
//
//  Created by 张博良 on 14/11/3.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "ViewController.h"
#import "CalculateBrain.h"

@interface ViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringDigit;
@property (nonatomic, strong) CalculateBrain *brain;

@end

@implementation ViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringDigit = _userIsInTheMiddleOfEnteringDigit;
@synthesize brain = _brain;

- (CalculateBrain *) brain {
    if (!_brain) {
        _brain = [[CalculateBrain alloc] init];
    }
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    
    if (!self.userIsInTheMiddleOfEnteringDigit) {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringDigit = YES;
        
    } else {
        self.display.text = [self.display.text stringByAppendingString:digit];
        
    }
    
}


- (IBAction)EnterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringDigit = NO;
}

- (IBAction)OperatorPressed:(UIButton *)sender {
    if ( self.userIsInTheMiddleOfEnteringDigit ) [self EnterPressed];
  
    double result = [self.brain performOperation:sender.currentTitle];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

@end
