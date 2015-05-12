//
//  CompassView.m
//  compass
//
//  Created by 张博良 on 15/4/25.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "CompassView.h"
#import "CompassLayer.h"

@implementation CompassView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize view;

+ (Class) layerClass {
    return [CompassLayer class];
}

@end
