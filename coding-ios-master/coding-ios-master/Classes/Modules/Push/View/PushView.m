//
//  DiscoveryView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "PushView.h"

#pragma mark - 声明
@interface PushView()

@end

#pragma mark - 实现
@implementation PushView

+ (instancetype)init {
    PushView *view = [PushView loadCode:ScreenBounds];
    return view;
}

@end

