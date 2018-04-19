//
//  AppDelegate.m
//  iOS
//
//  Created by 郑业强 on 2018/3/30.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "AppDelegate.h"

#pragma mark - 声明
@interface AppDelegate ()

@end

#pragma mark - 实现
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    if (@available(iOS 11.0, *)) {
//        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        
//    }
    [self setRootWindow];
    return YES;
}

- (void)setRootWindow {
    [self setWindow:[[UIWindow alloc] initWithFrame:ScreenBounds]];
    [self.window setBackgroundColor:[UIColor blackColor]];
    [self.window setRootViewController:({
        BaseTabBarController *tab = [[BaseTabBarController alloc] init];
        tab;
    })];
    [self.window makeKeyAndVisible];
}

@end

