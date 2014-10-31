//
//  Button.h
//  blocktest
//
//  Created by 张博良 on 14/10/28.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Button;

typedef void (^ButtonBlock) (Button * btn);

@interface Button : NSObject


@property (nonatomic, assign) ButtonBlock block;

- (void) click;
@end
