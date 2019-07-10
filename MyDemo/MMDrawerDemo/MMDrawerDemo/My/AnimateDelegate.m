//
//  AnimateDelegate.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/9.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "AnimateDelegate.h"
#import "ContentViewController.h"
@interface AnimateDelegate ()
@property (nonatomic, assign) UINavigationControllerOperation type;
@end
@implementation AnimateDelegate
- (instancetype)initWithType:(UINavigationControllerOperation)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"duration:%@",transitionContext);
    if (self.type == UINavigationControllerOperationPush) {
        return 0.3;
    } else {
        return 0.3;
    }
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"animte:%@",transitionContext);
    if (self.type == UINavigationControllerOperationNone) {
        NSAssert(NO, @"类型不对");
        return;
    }
    ContentViewController *contentVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    contentVC.transitioningDelegate;
    UITabBarController *tabBarVC = contentVC.tabBarController;
    if (contentVC && [contentVC isKindOfClass:ContentViewController.class]) {
        
    } else {
        contentVC = nil;
    }
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [containerView addSubview:toView];
    CGFloat toViewStartLeft = 0;
    CGFloat fromViewEndLeft = 0;
    CGAffineTransform tabBarOriTransform = CGAffineTransformIdentity;
    CGAffineTransform tabBarTargetTransform = CGAffineTransformIdentity;
    if (self.type == UINavigationControllerOperationPush) {
        toViewStartLeft = containerView.bounds.size.width;
        fromViewEndLeft = -containerView.bounds.size.width;
        tabBarOriTransform = CGAffineTransformIdentity;
        tabBarTargetTransform = CGAffineTransformMakeTranslation(0, tabBarVC.tabBar.frame.size.height);
    } else {
        toViewStartLeft = -containerView.bounds.size.width;
        fromViewEndLeft = containerView.bounds.size.width;
        tabBarOriTransform = CGAffineTransformMakeTranslation(0, tabBarVC.tabBar.frame.size.height);
    }
    CGAffineTransform toViewTransform = CGAffineTransformMakeTranslation(toViewStartLeft, 0);
    CGAffineTransform fromViewTransform = CGAffineTransformMakeTranslation(fromViewEndLeft, 0);
//    toView.transform = toViewTransform;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    toView.alpha = 0.3;
    tabBarVC.tabBar.transform = tabBarOriTransform;
    [UIView animateWithDuration:duration animations:^{
        toView.alpha = 1;
        fromView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        contentVC.statusBarHidden = YES;
        [contentVC setNeedsStatusBarAppearanceUpdate];
//        CGRect frame = contentVC.tabBarController.tabBar.frame;
//        contentVC.tabBarController.tabBar.frame = CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, frame.size.height);
        tabBarVC.tabBar.transform = tabBarTargetTransform;
//        fromView.transform = fromViewTransform;
//        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        tabBarVC.tabBar.transform = CGAffineTransformIdentity;
        BOOL isFinish = ![transitionContext transitionWasCancelled];
        if (isFinish) {
            tabBarVC.tabBar.hidden = self.type == UINavigationControllerOperationPush;
        }
        [transitionContext completeTransition:isFinish];
        
        return;
        //考虑到转场中途可能取消的情况，转场结束后，恢复视图状态。
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        //2
        BOOL isCancelled = transitionContext.transitionWasCancelled;
        [transitionContext completeTransition:!isCancelled];
    }];
}
@end
