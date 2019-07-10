//
//  AppDelegate.m
//  MMDrawerDemo
//
//  Created by Sinno on 2019/7/7.
//  Copyright © 2019 sinno. All rights reserved.
//

#import "AppDelegate.h"
#import "MyCenterViewController.h"
#import "MyLeftViewController.h"
#import <MMDrawerController/MMDrawerController.h>
#import <MMDrawerController/MMDrawerVisualState.h>
#import "CustomTabBarViewController.h"
#import "CustomNavgaitonController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController *centerVC = [self getCenterVC];
    UIViewController *leftVC = [self getLeftVC];
    MMDrawerController * drawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:centerVC
                                             leftDrawerViewController:leftVC
                                             rightDrawerViewController:nil];
    // 设置隐藏
    drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
//    drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    [drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block = [MMDrawerVisualState slideVisualStateBlock];
         block(drawerController,drawerSide, percentVisible);
     }];
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = drawerController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)getCenterVC {
    UIViewController *centerVC1 = [[MyCenterViewController alloc] init];
    centerVC1.title = @"首页";
    centerVC1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    UIViewController *centerVC2 = [[MyCenterViewController alloc] init];
    centerVC2.title = @"联系人";
    centerVC2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    UINavigationController *navVC = [[CustomNavgaitonController alloc] initWithRootViewController:centerVC1];
    UINavigationController *navVC2 = [[CustomNavgaitonController alloc] initWithRootViewController:centerVC2];
    UITabBarController *tabVC = [[CustomTabBarViewController alloc] init];
    
    tabVC.viewControllers = @[navVC,navVC2];
    return tabVC;
}

- (UIViewController *)getLeftVC {
    MyLeftViewController *leftVC = [[MyLeftViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:leftVC];
    return leftVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
