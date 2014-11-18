//
//  AddToDoItemViewController.m
//  toDoList
//
//  Created by 张博良 on 14/11/11.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFeild;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddToDoItemViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.doneButton) {
        return;
    }
    
    if (self.textFeild.text.length>0) {
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textFeild.text;
        self.toDoItem.completed = NO;
        self.toDoItem.creationDate = [NSDate date];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
