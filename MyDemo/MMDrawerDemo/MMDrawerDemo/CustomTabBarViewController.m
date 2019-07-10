//
//  CustomTabBarViewController.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/10.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "CustomTabBarViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.selectedViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.selectedViewController;
}
//- (UIViewController *)chi
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
