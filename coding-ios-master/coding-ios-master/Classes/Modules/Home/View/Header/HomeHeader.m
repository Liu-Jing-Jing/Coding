//
//  HomeHeaderView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeader.h"

#pragma mark - 声明
@interface HomeHeader()

@end

#pragma mark - 实现
@implementation HomeHeader

+ (instancetype)initWithFrame:(CGRect)frame {
    HomeHeader *view = [HomeHeader loadCode:frame];
    view.backgroundColor = LightColor;
    return view;
}

@end
