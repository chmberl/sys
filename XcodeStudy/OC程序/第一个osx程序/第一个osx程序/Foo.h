//
//  Foo.h
//  第一个osx程序
//
//  Created by 张博良 on 14/11/2.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Foo : NSObject{
    IBOutlet NSTextField *textfield;
}

- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;

@end
