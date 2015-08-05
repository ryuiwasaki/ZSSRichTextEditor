//
//  ColorPickerViewController.h
//  ZSSRichTextEditor
//
//  Created by Ryu Iwasaki on 2015/08/05.
//  Copyright © 2015年 Zed Said Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPickerViewControllerDelegate
- (void)setSelectedColor:(UIColor*)color tag:(int)tag;
@end


@interface ColorPickerViewController : UIViewController
@property (nonatomic) UIColor *color;
@property (nonatomic) int tag;
@property (nonatomic,weak)id<ColorPickerViewControllerDelegate> delegate;
@end
