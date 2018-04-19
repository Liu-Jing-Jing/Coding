//
//  ContentView.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ContentView.h"

#pragma mark - 声明
@interface ContentView ()

@end

#pragma mark - 实现
@implementation ContentView

+ (instancetype)init {
    ContentView *view = [ContentView loadCode:ScreenBounds];
    return view;
}

@end
