//
//  ViewController.h
//  PicDecor
//
//  Created by 张博良 on 14/11/3.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageEditing.h"

@interface ViewController : UIViewController {
    IBOutlet ImageEditing * vcImageEditing;
}

- (IBAction)doPhotoAlbumBtn:(id)sender;

- (IBAction)doCemeraBtn:(id)sender;

@end

