//
//  AnimateDelegate.h
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/9.
//  Copyright © 2019 sinno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AnimateDelegate : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithType:(UINavigationControllerOperation)type;
@end

NS_ASSUME_NONNULL_END
