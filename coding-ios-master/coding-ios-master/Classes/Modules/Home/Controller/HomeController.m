//
//  HomeController.m
//  iOS
//
//  Created by 郑业强 on 2018/4/1.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "HomeController.h"
#import "HomeView.h"
#import "UIViewController+LLAdd.h"

#pragma mark - 声明
@interface HomeController ()

@property (nonatomic, strong) HomeView *homeView;

@end

#pragma mark - 实现
@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"首页"];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self ll_setNavigationBarHidden:YES animated:YES];
}
//- (void)loadView {
//    self.view = [self homeView];
//}
//- (HomeView *)homeView {
//    if (!_homeView) {
//        _homeView = [HomeView init];
//    }
//    return _homeView;
//}

@end
