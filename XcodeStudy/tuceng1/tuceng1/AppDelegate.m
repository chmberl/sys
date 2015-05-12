//
//  AppDelegate.m
//  tuceng1
//
//  Created by 张博良 on 15/4/25.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    CALayer *lay1 = [[CALayer alloc] init];
    lay1.frame = CGRectMake(113, 111, 132, 194);
    lay1.backgroundColor = [[UIColor colorWithRed:0 green:4 blue:1 alpha:1] CGColor];
    [self.window.layer addSublayer:lay1];
    
    
    CALayer *lay2 = [[CALayer alloc] init];
    lay2.frame = CGRectMake(41, 56, 132, 194);
    lay2.backgroundColor = [[UIColor colorWithRed:5 green:1 blue:0 alpha:1] CGColor];
    [self.window.layer addSublayer:lay2];

    CALayer *lay3 = [[CALayer alloc] init];
    lay3.frame = CGRectMake(43, 197, 160, 230);
    lay3.backgroundColor = [[UIColor colorWithRed:1 green:0 blue:5 alpha:1] CGColor];
    [self.window.layer addSublayer:lay3];

    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
