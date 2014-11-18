//
//  FileOfData.h
//  toDoList
//
//  Created by 张博良 on 14/11/16.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "ToDoItem.h"

@interface FileOfData : NSObject

- (NSArray *) initialDataFromFile;
- (void) pushDataToFile:(NSArray *) array ;

@end
