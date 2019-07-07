//
//  UIColor+QD.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/7.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "UIColor+QD.h"

@implementation UIColor (QD)
+ (UIColor *)qd_colorWithRGB:(uint32_t)rgbValue {
    return [self qd_colorWithRGB:rgbValue alpha:1];
}
+ (UIColor *)qd_colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:alpha];
}
@end
