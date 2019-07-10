//
//  CustomNavgaitonController.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/10.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "CustomNavgaitonController.h"

@interface CustomNavgaitonController ()

@end

@implementation CustomNavgaitonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
