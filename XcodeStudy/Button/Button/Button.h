//
//  Button.h
//  Button
//
//  Created by 张博良 on 15/4/8.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Button;

typedef void (^ButtonBlock) (Button *);

@interface Button : NSObject

@property (nonatomic, assign) ButtonBlock block;

- (void) click;

- (NSString *)description;

@end
