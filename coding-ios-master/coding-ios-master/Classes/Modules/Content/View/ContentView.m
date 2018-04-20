//
//  ContentView.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ContentView.h"
#import "KKEmptyView.h"

#pragma mark - 声明
@interface ContentView ()

@property (nonatomic, strong) KKEmptyView *empty;

@end

#pragma mark - 实现
@implementation ContentView

+ (instancetype)init {
    ContentView *view = [ContentView loadCode:ScreenBounds];
    [view setBackgroundColor:[UIColor whiteColor]];
    [view icon];
    [view title];
    [view empty];
    return view;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2)];
        _icon.backgroundColor = LightColor;
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(0, CGRectGetMaxY(_icon.frame) + countcoordinatesY(10), ScreenWidth, 20);
        _title.backgroundColor = LightColor;
        [self addSubview:_title];
    }
    return _title;
}
- (KKEmptyView *)empty {
    if (!_empty) {
        _empty = [KKEmptyView initWithFrame:self.bounds];
        [self addSubview:_empty];
    }
    return _empty;
}

@end






