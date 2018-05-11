//
//  DetailView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailView.h"
#import "DetailContent.h"
#import "DetailContentBar.h"

#pragma mark - 声明
@interface DetailView ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *shadow;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (nonatomic, strong) DetailContentBar *bar;
@property (nonatomic, strong) DetailContent *content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollConstraintT;

@end

#pragma mark - 实现
@implementation DetailView

#pragma mark - 初始化
+ (instancetype)init {
    DetailView *view = [DetailView loadLastNib:CGRectMake(0, 0, ScreenWidth, ScreenHeight - TabbarHeight)];
    [view createView];
    return view;
}
- (void)createView {
    __weak typeof(self) weak = self;
    [self.scrollConstraintT setConstant:StatusBarHeight + NavigationBarHeight + countcoordinatesX(20)];
    [self setHidden:YES];
    [self bar];
    [self content];
    [self.shadow addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weak hide];
    }];
}
- (DetailContentBar *)bar {
    if (!_bar) {
        _bar = [DetailContentBar initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        [self addSubview:_bar];
    }
    return _bar;
}
- (DetailContent *)content {
    if (!_content) {
        _content = [DetailContent initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
        [_scroll addSubview:_content];
    }
    return _content;
}

#pragma mark - 动画
- (void)show {
    [self setHidden:NO];
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.3f animations:^{
        [weak.shadow setAlpha:0.3];
        [weak.content setTop:0];
    } completion:^(BOOL finished) {
        [weak.scroll setContentSize:CGSizeMake(0, _content.height)];
    }];
}
- (void)hide {
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.3f animations:^{
        [weak.shadow setAlpha:0];
        [weak.content setTop:ScreenHeight];
    } completion:^(BOOL finished) {
        [weak setHidden:YES];
    }];
}

#pragma mark - UIScrollViewDelegate



@end
