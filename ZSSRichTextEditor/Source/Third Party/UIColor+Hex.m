//
//  UIColor+Hex.m
//  ZSSRichTextEditor
//
//  Created by Ryu Iwasaki on 2015/08/05.
//  Copyright © 2015年 Zed Said Studio. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

- (NSString *)hexString {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

@end
