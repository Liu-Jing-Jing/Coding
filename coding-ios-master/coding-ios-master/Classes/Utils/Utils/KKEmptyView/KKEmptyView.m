//
//  KKEmptyView.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/20.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKEmptyView.h"
#import "UIView+Watch.h"

#pragma mark - 声明
@interface KKEmptyView ()

@property (nonatomic, strong) UIView *icon;
@property (nonatomic, strong) UIView *title;
@property (nonatomic, strong) UIView *timeIcon;
@property (nonatomic, strong) UIView *timeText;
@property (nonatomic, strong) UIView *authorIcon;
@property (nonatomic, strong) UIView *authorText;
@property (nonatomic, strong) UIView *link;

@end

#pragma mark - 实现
@implementation KKEmptyView

#pragma mark - 操作
- (void)show {
    [UIView animateWithDuration:.3f animations:^{
        self.alpha = 1;
    }];
}
- (void)hide {
    [UIView animateWithDuration:.3f animations:^{
        self.alpha = 0;
    }];
}

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    KKEmptyView *view = [[KKEmptyView alloc] initWithFrame:frame];
    [view setBackgroundColor:[UIColor whiteColor]];
    [view icon];
    [view title];
    [view timeIcon];
    [view timeText];
    [view authorIcon];
    [view authorText];
    [view link];
    [view createContent];
    return view;
}
- (void)createContent {
    CGFloat maxHeight = CGRectGetMaxY(_link.frame) + countcoordinatesY(10);
    int count = 0;
    while (maxHeight < ScreenHeight) {
        if (count % 4 == 0) {
            UIView *line = [self createView:maxHeight left:countcoordinatesX(10) height:1];
            [self addSubview:line];
            maxHeight = CGRectGetMaxY(line.frame) + countcoordinatesY(10);
        }
        CGFloat left = count % 4 == 0 ? countcoordinatesX(50) : countcoordinatesX(10);
        UIView *view = [self createView:maxHeight left:left height:countcoordinatesY(10)];
        [view cornerClipRadius:1];
        [self addSubview:view];
        maxHeight = CGRectGetMaxY(view.frame) + countcoordinatesY(10);
        
        count += 1;
    }
}
- (UIView *)createView:(CGFloat)maxHeight left:(CGFloat)left height:(CGFloat)height {
    UIView *line = [[UIView alloc] initWithFrame:({
        CGRectMake(left, maxHeight, ScreenWidth - left - countcoordinatesX(10), height);
    })];
    [line setBackgroundColor:ThinColor];
    return line;
}

- (UIView *)icon {
    if (!_icon) {
        _icon = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2)];
        _icon.backgroundColor = ThinColor;
        [self addSubview:_icon];
    }
    return _title;
}
- (UIView *)title {
    if (!_title) {
        _title = [[UIView alloc] initWithFrame:CGRectMake(countcoordinatesX(10), ScreenWidth / 2 + countcoordinatesY(10), ScreenWidth - countcoordinatesX(10) * 2, 0)];
        _title.height = [@"123" sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:FontName(15)].height;
        _title.backgroundColor = ThinColor;
        [_title cornerClipRadius:1];
        [self addSubview:_title];
    }
    return _title;
}
- (UIView *)timeIcon {
    if (!_timeIcon) {
        _timeIcon = [[UIView alloc] initWithFrame:CGRectMake(countcoordinatesX(10), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 10, 10)];
        _timeIcon.backgroundColor = ThinColor;
        [_timeIcon cornerClipRadius:5];
        [self addSubview:_timeIcon];
    }
    return _timeIcon;
}
- (UIView *)timeText {
    if (!_timeText) {
        _timeText = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_timeIcon.frame) + countcoordinatesX(5), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 40, 10)];
        _timeText.backgroundColor = ThinColor;
        [_timeText cornerClipRadius:1];
        [self addSubview:_timeText];
    }
    return _timeText;
}
- (UIView *)authorIcon {
    if (!_authorIcon) {
        _authorIcon = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_timeText.frame) + countcoordinatesX(10), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 10, 10)];
        _authorIcon.backgroundColor = ThinColor;
        [_authorIcon cornerClipRadius:5];
        [self addSubview:_authorIcon];
    }
    return _timeIcon;
}
- (UIView *)authorText {
    if (!_authorText) {
        _authorText = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_authorIcon.frame) + countcoordinatesX(5), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 40, 10)];
        _authorText.backgroundColor = ThinColor;
        [_authorText cornerClipRadius:1];
        [self addSubview:_authorText];
    }
    return _authorText;
}
- (UIView *)link {
    if (!_link) {
        _link = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_authorText.frame) + countcoordinatesX(10), CGRectGetMaxY(_title.frame) + countcoordinatesY(10), 40, 10)];
        _link.backgroundColor = ThinColor;
        [_link cornerClipRadius:1];
        [self addSubview:_link];
    }
    return _link;
}

@end
