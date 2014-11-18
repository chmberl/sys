//
//  main.m
//  AppendData
//
//  Created by 张博良 on 14/11/15.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *homePath = NSHomeDirectory();
        
        
//        NSString *filePath = [homePath stringByAppendingPathComponent: @"sys/pyweb01/objectTest.py"];
        
//        NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
        
//        [handle seekToEndOfFile];
//        NSString *str = @"追加的数据";
//        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//        [handle writeData:data];
//        [handle closeFile];
//        NSUInteger length = [handle availableData].length;
//        [handle seekToFileOffset:length/2];
//        NSData *data = [handle readDataToEndOfFile];
//        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", str);
//        [handle closeFile];
        
        NSString *filePath = [homePath stringByAppendingPathComponent:@"sys/pyweb01/objectTest.py"];
        NSString *targetPath = [homePath stringByAppendingPathComponent:@"sys/pyweb01/objectTest_bak.py"];
        NSFileManager *fm = [NSFileManager defaultManager];
        BOOL success = [fm createFileAtPath:targetPath contents:nil attributes:nil];
        if (success) {
            NSLog(@"create success");
        }
        NSFileHandle *inFileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
        NSFileHandle *outFileHandle = [NSFileHandle fileHandleForWritingAtPath:targetPath];
        
        while (YES) {
            NSData *data = [inFileHandle readDataOfLength:10];
            if (data.length > 0) {
                [outFileHandle writeData:data];
                NSLog(@"read data");
            } else {
                break;
            }

        }
        [inFileHandle closeFile];
        [outFileHandle closeFile];
        
    }
    return 0;
}
