//
//  ContentController.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ContentController.h"

#pragma mark - 声明
@interface ContentController ()

@end

#pragma mark - 实现
@implementation ContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftClick:@[@[@"back",@""]]];
    [self setJz_wantsNavigationBarVisible:NO];
//    [self setJz_navigationBarTintColor:[UIColor clearColor]];
}
- (void)leftItemPressed:(NSInteger)index {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loadView {
    self.view = [self contentView];
}
- (ContentView *)contentView {
    if (!_contentView) {
        _contentView = [ContentView init];
    }
    return _contentView;
}







@end
