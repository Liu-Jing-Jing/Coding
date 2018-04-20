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

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *timeIcon;
@property (nonatomic, strong) UILabel *timeText;
@property (nonatomic, strong) UIImageView *authorIcon;
@property (nonatomic, strong) UILabel *authorText;
@property (nonatomic, strong) UIButton *link;

@property (nonatomic, strong) KKEmptyView *empty;

@end

#pragma mark - 实现
@implementation ContentView

+ (instancetype)init {
    ContentView *view = [ContentView loadCode:ScreenBounds];
    [view setBackgroundColor:[UIColor whiteColor]];
    [view scroll];
    [view icon];
    [view title];
    [view timeIcon];
    [view timeText];
    [view authorIcon];
    [view authorText];
    [view link];
    [view empty];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view.empty hide];
        [view.empty removeFromSuperview];
    });
    return view;
}
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [self addSubview:_scroll];
    }
    return _scroll;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2)];
        _icon.backgroundColor = LightColor;
        [self.scroll addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(countcoordinatesX(10), CGRectGetMaxY(_icon.frame) + countcoordinatesY(10), ScreenWidth - countcoordinatesX(10) * 2, 20);
        _title.backgroundColor = LightColor;
        _title.text = @"不止 Java, Oracle 向 JavaScript 开炮!";
        _title.font = FontName(15);
        _title.textColor = ColorTextHeavy;
        _title.height = [_title.text sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:_title.font].height;
        [self.scroll addSubview:_title];
    }
    return _title;
}
- (UIImageView *)timeIcon {
    if (!_timeIcon) {
        _timeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(countcoordinatesX(10), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 10, 10)];
        _timeIcon.image = [UIImage imageNamed:@"time"];
        [self.scroll addSubview:_timeIcon];
    }
    return _timeIcon;
}
- (UILabel *)timeText {
    if (!_timeText) {
        _timeText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_timeIcon.frame) + countcoordinatesX(5), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 40, 10)];
        _timeText.text = @"23分钟以前";
        _timeText.font = FontName(10);
        _timeText.textColor = ColorTextLight;
        _timeText.width = [_timeText.text sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:_timeText.font].width;
        [self.scroll addSubview:_timeText];
    }
    return _timeText;
}

- (UIImageView *)authorIcon {
    if (!_authorIcon) {
        _authorIcon = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_timeText.frame) + countcoordinatesX(10), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 10, 10)];
        _authorIcon.image = [UIImage imageNamed:@"eye"];
        [self.scroll addSubview:_authorIcon];
    }
    return _authorIcon;
}
- (UILabel *)authorText {
    if (!_authorText) {
        _authorText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_authorIcon.frame) + countcoordinatesX(5), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 40, 10)];
        _authorText.text = @"张益达";
        _authorText.font = FontName(10);
        _authorText.textColor = ColorTextLight;
        _authorText.width = [_authorText.text sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:_authorText.font].width;
        [self.scroll addSubview:_authorText];
    }
    return _authorText;
}
- (UIButton *)link {
    if (!_link) {
        _link = [UIButton buttonWithType:UIButtonTypeCustom];
        [_link setTitle:@"原文链接" forState:UIControlStateNormal];
        [_link.titleLabel setFont:FontName(10)];
        [_link setTitleColor:ColorTextLight forState:UIControlStateNormal];
        [_link setFrame:CGRectMake(CGRectGetMaxX(_authorText.frame) + countcoordinatesX(10), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 40, 10)];
        [_link setWidth:[_link.titleLabel.text sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:_link.titleLabel.font].width];
        [self.scroll addSubview:_link];
    }
    return _link;
}


- (KKEmptyView *)empty {
    if (!_empty) {
        _empty = [KKEmptyView initWithFrame:self.bounds];
        [self addSubview:_empty];
    }
    return _empty;
}

@end






