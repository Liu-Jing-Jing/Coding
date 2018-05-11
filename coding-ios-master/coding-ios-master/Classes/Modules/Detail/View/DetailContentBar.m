//
//  DetailContentBar.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailContentBar.h"

#pragma mark - 声明
@interface DetailContentBar ()

@end

#pragma mark - 实现
@implementation DetailContentBar

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    DetailContentBar *view = [[DetailContentBar alloc] initWithFrame:frame];
    view.height = StatusBarHeight + 44;
    view.top = -view.height;
    return view;
}
- (void)show {
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.3f animations:^{
        weak.top = 0;
    }];
}
- (void)hide {
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.3f animations:^{
        weak.top = -weak.height;
    }];
}


@end
