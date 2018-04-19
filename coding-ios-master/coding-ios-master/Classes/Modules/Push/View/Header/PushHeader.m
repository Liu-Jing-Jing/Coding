//
//  PushHeader.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "PushHeader.h"

#pragma mark - 声明
@interface PushHeader()

@end

#pragma mark - 实现
@implementation PushHeader

+ (instancetype)initWithFrame:(CGRect)frame {
    PushHeader *view = [PushHeader loadCode:frame];
    view.backgroundColor = LightColor;
    return view;
}

@end
