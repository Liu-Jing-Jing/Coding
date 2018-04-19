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
    [view setBackgroundColor:[UIColor redColor]];
    [view icon];
    return view;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2)];
        _icon.backgroundColor = LightColor;
        _icon.alpha = 0;
        [self addSubview:_icon];
    }
    return _icon;
}
- (void)transitionDidAppear {
    self.icon.alpha = 1;
}
- (void)transitionDidDisappear {
    self.icon.alpha = 0;
}

@end
