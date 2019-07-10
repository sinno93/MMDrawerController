//
//  MyCenterViewController.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/7.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "MyCenterViewController.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import <Masonry/Masonry.h>
#import "UIColor+QD.h"
#import "AnimateDelegate.h"
#import "ContentViewController.h"

@interface MyCenterViewController () <UINavigationControllerDelegate>
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) AnimateDelegate *delegate;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;
@end

@implementation MyCenterViewController

#pragma mark - Initialization

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__FUNCTION__);
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.navigationController.view addGestureRecognizer:panRecognizer];
    self.navigationController.delegate = self;
    [self configSubviews];
}

- (void)pan:(UIPanGestureRecognizer*)recognizer
{
    UIView* view = self.navigationController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [recognizer locationInView:view];
        if (location.x > CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count == 1){
            self.interactionController = [UIPercentDrivenInteractiveTransition new];
            [self buttonClick:nil];
        }
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        // fabs() 求浮点数的绝对值
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:view].x < 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - Actions
- (void)buttonClick:(UIButton *)button {
    UIViewController *vc = [ContentViewController new];
    vc.title = @"下一个页面";
    vc.view.backgroundColor = UIColor.cyanColor;
//    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    return;
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        NSLog(@"%@",self.mm_drawerController);
    }];
    
}
#pragma mark - Delegates

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController*)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>)animationController
{
    NSLog(@"interactive:%s",__FUNCTION__);
    return self.interactionController;
//    return nil;
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    NSLog(@"fromVC:%@,toVC:%@",fromVC,toVC);
//    if (operation == UINavigationControllerOperationPop) {
//        return nil;
//    }
    AnimateDelegate *delegate = [[AnimateDelegate alloc] initWithType:operation];
    return delegate;
}

#pragma mark - Private methods
- (void)configSubviews {
    self.view.backgroundColor = [UIColor qd_colorWithRGB:0x54a0ff];
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}
#pragma mark - Setter && Getter
- (UIButton *)button {
    if (!_button) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"打开" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _button = button;
    }
    return _button;
}
- (AnimateDelegate *)delegate {
    if (!_delegate) {
        _delegate = [AnimateDelegate new];
    }
    return _delegate;
}
@end
