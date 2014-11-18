//
//  ToDoItem.h
//  toDoList
//
//  Created by 张博良 on 14/11/12.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property NSDate *creationDate;

- (void) markAsCompleted:(BOOL)isComplete;
- (id) initWithName:(NSString *)itemName Completed:(BOOL) completed CreationDate:(NSDate *)creationDate;

@end
