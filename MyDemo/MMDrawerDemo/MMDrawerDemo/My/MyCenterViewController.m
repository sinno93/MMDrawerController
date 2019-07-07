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

@interface MyCenterViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation MyCenterViewController

#pragma mark - Initialization

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__FUNCTION__);
    [self configSubviews];
}
#pragma mark - Actions
- (void)buttonClick:(UIButton *)button {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        NSLog(@"%@",self.mm_drawerController);
    }];
    
}
#pragma mark - Delegates

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
@end
