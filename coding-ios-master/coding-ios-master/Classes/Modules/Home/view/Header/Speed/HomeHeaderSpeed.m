//
//  HomeHeaderSpeed.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeaderSpeed.h"
#import "HomeHeaderSlider.h"

#pragma mark - 声明
@interface HomeHeaderSpeed()

@property (nonatomic, strong) HomeHeaderSlider *slider1;
@property (nonatomic, strong) HomeHeaderSlider *slider2;
@property (nonatomic, strong) HomeHeaderSlider *slider3;
@property (nonatomic, strong) UIButton *close;

@end

#pragma mark - 实现
@implementation HomeHeaderSpeed

#pragma mark - 初始化
- (void)initUI {
    [self setAlpha:0];
    [self setUserInteractionEnabled:NO];
    [self slider1];
    [self slider2];
    [self slider3];
    [self close];
    [self setHeight:CGRectGetMaxY(_close.frame)];
}
- (HomeHeaderSlider *)slider1 {
    if (!_slider1) {
        _slider1 = [HomeHeaderSlider loadCode:CGRectMake(0, 0, ScreenWidth, 0)];
        [self addSubview:_slider1];
    }
    return _slider1;
}
- (HomeHeaderSlider *)slider2 {
    if (!_slider2) {
        _slider2 = [HomeHeaderSlider loadCode:CGRectMake(0, CGRectGetMaxY(_slider1.frame) + 5, ScreenWidth, 0)];
        [self addSubview:_slider2];
    }
    return _slider2;
}
- (HomeHeaderSlider *)slider3 {
    if (!_slider3) {
        _slider3 = [HomeHeaderSlider loadCode:CGRectMake(0, CGRectGetMaxY(_slider2.frame) + 5, ScreenWidth, 0)];
        [self addSubview:_slider3];
    }
    return _slider3;
}
- (UIButton *)close {
    if (!_close) {
        __weak typeof(self) weak = self;
        _close = [UIButton buttonWithType:UIButtonTypeCustom];
        _close.backgroundColor = [UIColor redColor];
        _close.frame = CGRectMake(0, CGRectGetMaxY(_slider3.frame) +countcoordinatesX(20), 25, 25);
        _close.centerX = self.centerX;
        [_close addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            if (weak.delegate && [weak.delegate respondsToSelector:@selector(homeControl:didTapClose:)]) {
                [weak.delegate homeControl:weak didTapClose:weak.close];
            }
        }];
        [self addSubview:_close];
    }
    return _close;
}

#pragma mark - 设置
- (void)show:(CGFloat)alpha {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setAlpha:alpha];
    } completion:^(BOOL finished) {
        [self setUserInteractionEnabled:YES];
    }];
}

@end
