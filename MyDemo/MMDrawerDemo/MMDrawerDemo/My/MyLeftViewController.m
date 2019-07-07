//
//  MyLeftViewController.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/7.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "MyLeftViewController.h"
#import "UIColor+QD.h"

@interface MyLeftViewController ()

@end

@implementation MyLeftViewController

#pragma mark - Initialization

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__FUNCTION__);
    [self configSubviews];
}
#pragma mark - Actions

#pragma mark - Delegates

#pragma mark - Private methods
- (void)configSubviews {
    self.view.backgroundColor = [UIColor qd_colorWithRGB:0xff6b6b];
}
#pragma mark - Setter && Getter

@end
