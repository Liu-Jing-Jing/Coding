//
//  KKNavigationBar.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKNavigationBar.h"

#pragma mark - 声明
@interface KKNavigationBar ()

@end

#pragma mark - 实现
@implementation KKNavigationBar

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    KKNavigationBar *view = [KKNavigationBar loadCode:frame];
    return view;
}

@end
