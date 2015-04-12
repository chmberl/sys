//
//  AppDelegate.swift
//  buttonCocoa
//
//  Created by 张博良 on 15/4/11.
//  Copyright (c) 2015年 张博良. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var pushButton: NSButton
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func pushButtonClick() {
        print("hello, welcome to http://www.chmbel.com");
    }
    
    pushButton.action = Selector("pushButtonClick");

}

