//
//  UIColor+QD.h
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/7.
//  Copyright © 2019 sinno. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (QD)
+ (UIColor *)qd_colorWithRGB:(uint32_t)rgbValue;
+ (UIColor *)qd_colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
