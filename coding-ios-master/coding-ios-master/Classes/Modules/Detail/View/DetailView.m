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

#define Shadow_Alpha 0.5
#define Shadow_Min_Alpha 0.2
#define Shadow_Max_Alpha 0.8

#pragma mark - 声明
@interface DetailView ()<UIScrollViewDelegate> {
    UIStatusBarStyle _originalStyle;
}

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
    DetailView *view = [DetailView loadLastNib:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [view createView];
    return view;
}
- (void)createView {
    _originalStyle = [UIApplication sharedApplication].statusBarStyle;
    [self.scrollConstraintT setConstant:StatusBarHeight + NavigationBarHeight + countcoordinatesX(20)];
    [self setHidden:YES];
    [self content];
    [self bar];
    __weak typeof(self) weak = self;
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
    [self.shadow setAlpha:0];
    [StatusUtils setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    __weak typeof(self) weak = self;
    [UIView animateKeyframesWithDuration:.5f delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [weak.shadow setAlpha:Shadow_Alpha];
        [weak.content setTop:0];
    } completion:^(BOOL finished) {
        [weak.scroll setContentSize:CGSizeMake(0, _content.height)];
    }];
}
- (void)hide {
    __weak typeof(self) weak = self;
    [StatusUtils setStatusBarStyle:_originalStyle animated:NO];
    [UIView animateKeyframesWithDuration:.5f delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [weak.shadow setAlpha:0];
        [weak.content setTop:ScreenHeight];
    } completion:^(BOOL finished) {
        [weak setHidden:YES];
        [weak removeFromSuperview];
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 显示Bar
    if (scrollView.contentOffset.y >= (_content.icon.height / 2 + StatusBarHeight)) {
        [_bar show];
        [StatusUtils setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        [_scroll setBackgroundColor:[UIColor whiteColor]];
    }
    // 隐藏Bar
    else {
        [_bar hide];
        [StatusUtils setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        [_scroll setBackgroundColor:[UIColor clearColor]];
    }
    // 透明度
    CGFloat alpha = scrollView.contentOffset.y / _content.icon.height / 2 + Shadow_Alpha;
    alpha = alpha < Shadow_Min_Alpha ? Shadow_Min_Alpha : alpha;
    alpha = alpha > Shadow_Max_Alpha ? Shadow_Max_Alpha : alpha;
    _shadow.alpha = alpha;
    NSLog(@"%.2f", scrollView.contentOffset.y);
}
// 拖拽松手时
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentOffset.y < -_content.icon.height / 2) {
        [scrollView setContentOffset:CGPointMake(0, -scrollView.contentOffset.y)];
        [self hide];
    }
}



@end
