//
//  ToDoItem.m
//  toDoList
//
//  Created by 张博良 on 14/11/12.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "ToDoItem.h"

@interface ToDoItem ()

@property NSDate *completionDate;

@end

@implementation ToDoItem


- (id)initWithName:(NSString *)itemName Completed:(BOOL)completed CreationDate:(NSDate *)creationDate {
    id item = [self init];
    _itemName = itemName;
    _completed = completed;
    _creationDate = creationDate;
    return item;
}

- (void)markAsCompleted:(BOOL)isComplete {
    self.completed = isComplete;
}


- (void) setCompletiondate {
    if (self.completed) {
        self.completionDate = [NSDate date];
    } else {
        self.completionDate = nil;
    }
}

@end
