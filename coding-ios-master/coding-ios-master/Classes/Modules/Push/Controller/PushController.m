//
//  DiscoveryController.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "PushController.h"
#import "PushView.h"

#pragma mark - 声明
@interface PushController()

@property (nonatomic, strong) PushView *pushView;

@end

#pragma mark - 实现
@implementation PushController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"我的"];
}
- (void)loadView {
    self.view = [self pushView];
}
- (PushView *)pushView {
    if (!_pushView) {
        _pushView = [PushView init];
    }
    return _pushView;
}

@end

