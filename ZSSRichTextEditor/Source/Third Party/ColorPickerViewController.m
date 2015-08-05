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
    self.edgesForExtendedLayout = NO;
    CGFloat topOffset = self.topLayoutGuide.length;
    CGRect frame = CGRectMake(0, topOffset, self.view.frame.size.width, self.view.frame.size.height - topOffset);
    _colorPickerView.frame = frame;
    _colorPickerView.color = self.color;
    [_colorPickerView addTarget:self
                         action:@selector(action:)
               forControlEvents:UIControlEventValueChanged];
    _colorPickerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_colorPickerView];
    
    if ( self.navigationController ) {
        
    }
    UIView *view = _colorPickerView;
    id topGuide = self.topLayoutGuide;
    NSNumber *guideLength = [NSNumber numberWithInteger:self.topLayoutGuide.length];
    NSDictionary *topAndViews = NSDictionaryOfVariableBindings(view, topGuide);
    NSDictionary *length = NSDictionaryOfVariableBindings(guideLength);
    NSArray *topGuideConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-guideLength-[view]"
                                                                           options:0
                                                                           metrics:length
                                                                             views:topAndViews];
    [self.view addConstraints:topGuideConstraints];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(view);
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:views];
    [self.view addConstraints:hConstraints];
    
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-0-|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:views];
    [self.view addConstraints:vConstraints];
    
    
    
    [self.view layoutIfNeeded];
    
    [self addSaveButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSaveButton {
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItems = @[button];
    
}

- (void)action:(id)sender {
    
    self.color = _colorPickerView.color;
    
}

- (void)save:(id)sender{
    
    if (self.delegate) {
        
        [self.delegate setSelectedColor:_colorPickerView.color tag:self.tag];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
