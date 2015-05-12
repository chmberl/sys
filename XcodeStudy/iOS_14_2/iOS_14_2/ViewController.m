//
//  ViewController.m
//  iOS_14_2
//
//  Created by 张博良 on 15/4/21.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "ViewController.h"

#define kSectionCount 2
#define kRedSection 0
#define kBlueSection 1

@implementation ViewController

@synthesize redFlowers;
@synthesize blueFlowers;

- (void)viewDidLoad {
    
    self.redFlowers = [[NSArray alloc] initWithObjects:@"aa", @"bb", @"cc", @"dd", nil];
    self.blueFlowers = [[NSArray alloc] initWithObjects:@"ee", @"ff", @"gg", @"hh", @"ii", nil];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return kSectionCount;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case kRedSection:
            return [self.redFlowers count];
            break;
        case kBlueSection:
            return [self.blueFlowers count];
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case kRedSection:
            return @"红";
            break;
        case kBlueSection:
            return @"蓝";
        default:
            return @"Unknown";
            break;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerCell"];
    
    switch (indexPath.section) {
        case kRedSection:
            cell.textLabel.text = [self.redFlowers objectAtIndex:indexPath.row];
            break;
        case kBlueSection:
            cell.textLabel.text = [self.blueFlowers objectAtIndex:indexPath.row];
            break;
        default:
            cell.textLabel.text = @"Unknown";
            break;
    }
    
    UIImage *flowerImage;
    flowerImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@",cell.textLabel.text, @".png"]];
    cell.imageView.image = flowerImage;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *showSelection;
    NSString *flowerMessage;
    
    switch (indexPath.section) {
        case kRedSection:
            flowerMessage = [[NSString alloc] initWithFormat:@"你选择了红色-%@", [self.redFlowers objectAtIndex: indexPath.row]];
            break;
        case kBlueSection:
            flowerMessage = [[NSString alloc] initWithFormat:@"你选择了蓝色-%@", [self.blueFlowers objectAtIndex:indexPath.row]];
            break;
        default:
            break;
    }
    
    showSelection = [[UIAlertView alloc] initWithTitle:@"已经选择了" message:flowerMessage delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [showSelection show];
}



@end

































