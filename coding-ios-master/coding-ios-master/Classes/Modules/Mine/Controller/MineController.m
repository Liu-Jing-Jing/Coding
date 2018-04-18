//
//  DiscoveryController.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineController.h"
#import "MineView.h"

#pragma mark - 声明
@interface MineController()

@property (nonatomic, strong) MineView *mineView;

@end

#pragma mark - 实现
@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"我的"];
}
- (void)loadView {
    self.view = [self mineView];
}
- (MineView *)mineView {
    if (!_mineView) {
        _mineView = [MineView init];
    }
    return _mineView;
}

@end

