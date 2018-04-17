//
//  BaseTabBarController.m
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "BaseTabBarController.h"

#pragma mark - 声明
@interface BaseTabBarController ()

@end

#pragma mark - 实现
@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeController *home = [[HomeController alloc] init];
    [self addChildViewController:home title:@"首页" image:@"tab_home_24x24_" selImage:@"tab_home_selected_24x24_"];
    
//    [self setSelectedIndex:3];
}

- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    static NSInteger index = 0;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.tag = index;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:10.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MediumColor, NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:10.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];
    index++;
    // 让子控制器包装一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


@end
