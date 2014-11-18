//
//  ToDoListTableViewController.m
//  toDoList
//
//  Created by 张博良 on 14/11/11.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"
#import "FileOfData.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;
@property (strong)FileOfData *data;
@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
}

- (void) loadInitialData {
    self.data = [[FileOfData alloc] init];
    self.toDoItems = [[self.data initialDataFromFile] mutableCopy];
    
}

- (void) loadInitialDataFromFile {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentfier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentfier forIndexPath:indexPath];
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (void)unwindToList:(UIStoryboardSegue *)Segure {
    AddToDoItemViewController *source = [Segure sourceViewController];
    ToDoItem *item = source.toDoItem;
    if (item) {
        [self.toDoItems addObject:item];

        [self.data pushDataToFile:self.toDoItems];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
