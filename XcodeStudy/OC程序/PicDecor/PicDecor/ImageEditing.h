//
//  ImageEditing.h
//  PicDecor
//
//  Created by 张博良 on 14/11/3.
//  Copyright (c) 2014年 张博良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Decornations.h"

@interface ImageEditing : UIViewController{
    IBOutlet UIImageView *ivEditingImage;
    IBOutlet Decornations *ivDecorations;
}

- (IBAction)doDecorateBtn:(id)sender;

- (IBAction)doEmailBtn:(id)sender;

@end
