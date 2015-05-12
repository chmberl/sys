//
//  TestView.m
//  ThreePointTest
//
//  Created by 张博良 on 15/4/25.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        pointArray = [[NSMutableArray alloc] initWithCapacity:3];
        UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 320, 40)];
        label.text = @"任意单击屏幕内的三点已确定一个三角形";
        [self addSubview:label];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1.0);
    CGContextSetLineWidth(context, 2.0);
    CGPoint addlines[] = {
        firstPoint, secondPoint, threePoint, firstPoint,
    };
    
    CGContextAddLines(context, addlines, sizeof(addlines)/sizeof(addlines[0]));
    CGContextStrokePath(context);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [pointArray addObject:[NSValue valueWithCGPoint:point]];
    if (pointArray.count >3) {
        [pointArray removeObjectAtIndex:0];
    }
    if (pointArray.count == 3) {
        firstPoint = [[pointArray objectAtIndex:0] CGPointValue];
        secondPoint  = [[pointArray objectAtIndex:1] CGPointValue];
        threePoint = [[pointArray objectAtIndex:2] CGPointValue];
        
    }
    
    [self setNeedsDisplay];
}

@end





















