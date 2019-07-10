//
//  MyLeftViewController.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/7.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "MyLeftViewController.h"
#import "UIColor+QD.h"
#import <Masonry/Masonry.h>
@interface MyLeftViewController ()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MyLeftViewController

#pragma mark - Initialization

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__FUNCTION__);
    self.title = @"侧边栏";
    [self configSubviews];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Actions

#pragma mark - Delegates

#pragma mark - Private methods
- (void)configSubviews {
    self.view.backgroundColor = [UIColor qd_colorWithRGB:0xff6b6b];
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(@44);
    }];
}
#pragma mark - Setter && Getter
- (UIView *)topView {
    if (!_topView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor =UIColor.whiteColor;
        _topView = view;
    }
    return _topView;
}
@end
