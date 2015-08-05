//
//  ColorPickerViewController.m
//  ZSSRichTextEditor
//
//  Created by Ryu Iwasaki on 2015/08/05.
//  Copyright © 2015年 Zed Said Studio. All rights reserved.
//

#import "ColorPickerViewController.h"
#import <Color-Picker-for-iOS/HRColorPickerView.h>
@interface ColorPickerViewController ()
@property (nonatomic, strong) HRColorPickerView *colorPickerView;
@end

@implementation ColorPickerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _colorPickerView = [[HRColorPickerView alloc] init];
    _colorPickerView.color = self.color;
    [_colorPickerView addTarget:self
                        action:@selector(action:)
              forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_colorPickerView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)action:(id)sender {
   
    self.color = _colorPickerView.color;
}

- (void)save
{
    if (self.delegate) {

        [self.delegate setSelectedColor:_colorPickerView.color tag:self.tag];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
