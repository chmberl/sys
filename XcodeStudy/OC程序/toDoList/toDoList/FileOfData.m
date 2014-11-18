//
//  FileOfData.m
//  toDoList
//
//  Created by 张博良 on 14/11/16.
//  Copyright (c) 2014年 张博良. All rights reserved.
//
#define TODOITEM (int)100
#import "FileOfData.h"

@implementation FileOfData

- (NSMutableArray *)initialDataFromFile {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    NSString *filePath = [self openOrCreateFile];
    if (filePath == nil) {
        return nil;
    };
    
    
    NSFileHandle *inHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    
    while (YES) {
        ToDoItem *toDoItem = [self readToDoItem:inHandle];
        //将待办事项添加到数组
        if (!toDoItem) break;
        [array addObject:toDoItem];
        
    }
    
    [inHandle closeFile];
    
    return array;
}

//从文件中读取待办信息
- (ToDoItem *) readToDoItem:(NSFileHandle *) inHandle {
    //读取完成日期
    NSString *strDate = [NSString stringWithFormat:@"%@",[NSDate date]];
    NSData *data = [inHandle readDataOfLength:[strDate length]];
    if (data.length==0) return nil;
    double timeInterval = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    
    //读取布尔值
    data = [inHandle readDataOfLength:1];
    if (data.length==0) nil;
    BOOL complete = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] boolValue];
    
    //读取待办信息
    data = [inHandle readDataOfLength:TODOITEM];
    if (data.length==0) nil;
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    ToDoItem *toDoItem = [[ToDoItem alloc] initWithName:str Completed:complete CreationDate:date];
    return toDoItem;
}

//将待办信息写入文件
- (void)pushDataToFile:(NSArray *) array {
    NSString *filePath = [self openOrCreateFile];
    
    if (filePath == nil) {
        exit(1);
    }
    
    NSFileHandle *outHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    int offset = 0;
    for (int i =0; i < array.count; i++) {
        ToDoItem *toDoItem = array[i];
        
        [self writeToDoItem:outHandle withItem:toDoItem];
        offset += [[NSString stringWithFormat:@"%@",toDoItem.creationDate] length] + [[NSString stringWithFormat:@"%i",toDoItem.completed] length] + 100;
        //[outHandle seekToFileOffset:offset];
    }
    
    [outHandle closeFile];

}

- (void) writeToDoItem:(NSFileHandle *) outHandle withItem:(ToDoItem *) toDoItem{
    [outHandle truncateFileAtOffset:0];
    
    NSData *data =[[NSString stringWithFormat:@"%@",toDoItem.creationDate] dataUsingEncoding:NSUTF8StringEncoding];
    [outHandle writeData: data];
    data = [[NSString stringWithFormat:@"%i",toDoItem.completed] dataUsingEncoding:NSUTF8StringEncoding];
    [outHandle writeData: data];
    
    data = [[NSString stringWithFormat:@"%@",toDoItem.itemName] dataUsingEncoding:NSUTF8StringEncoding];
    [outHandle writeData:data];
  
}

- (NSString *) openOrCreateFile {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = @"Users/exit0/sys/pyweb01/toDoList.txt";
    if (![fileManager fileExistsAtPath:filePath]) {
        BOOL success = [fileManager createFileAtPath:filePath contents:nil attributes:nil];

        if (!success) return nil;
    }
    return filePath;
}

@end
