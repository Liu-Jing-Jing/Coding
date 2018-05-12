//
//  DetailContentBar.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailContentBar.h"

#pragma mark - 声明
@interface DetailContentBar ()

@property (nonatomic, assign, getter=isShow) BOOL show;

@end

#pragma mark - 实现
@implementation DetailContentBar

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    DetailContentBar *view = [[NSBundle mainBundle] loadNibNamed:@"DetailContentBar" owner:nil options:nil].firstObject;
    view.frame = frame;
    view.height = StatusBarHeight + 44;
    view.show = NO;
    view.top = -view.height;
    return view;
}
- (void)show {
    if (self.show == YES) {
        return;
    }
    self.show = YES;
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.2f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        weak.top = 0;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide {
    if (self.show == NO) {
        return;
    }
    self.show = NO;
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.2f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        weak.top = -weak.height;
    } completion:^(BOOL finished) {
        
    }];
}

@end
