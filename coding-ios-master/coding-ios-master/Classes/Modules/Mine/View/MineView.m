//
//  DiscoveryView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineView.h"

#pragma mark - 声明
@interface MineView()

@end

#pragma mark - 实现
@implementation MineView

+ (instancetype)init {
    MineView *view = [MineView loadCode:ScreenBounds];
    return view;
}

@end

