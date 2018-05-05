//
//  StoreHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreHeader.h"
#import "TLSegmentedControl.h"

#pragma mark - 声明
@interface StoreHeader()<TLSegmentedControlDelegate>


@end

#pragma mark - 实现
@implementation StoreHeader

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    StoreHeader *header = [StoreHeader loadCode:frame];
    [header createView];
    return header;
}
- (void)createView {
    [self search];
    [self setHeight:80 + StatusBarHeight];
}
- (UITextField *)search {
    if (!_search) {
        _search = [[UITextField alloc] initWithFrame:({
            CGFloat left = countcoordinatesX(15);
            CGFloat width = ScreenWidth - left * 2;
            CGFloat height = 30;
            CGFloat top = (40 - height) / 2;
            CGRectMake(left, StatusBarHeight + top, width, height);
        })];
        [_search setBackgroundColor:RGBA(245, 245, 245, 1)];
        [_search setPlaceholder:@"搜索本地或书城"];
        [_search setFont:[UIFont systemFontOfSize:adjustFont(12)]];
        [_search setLeftViewMode:UITextFieldViewModeAlways];
        [_search.layer setCornerRadius:5];
        [_search.layer setMasksToBounds:YES];
        [_search setLeftView:({
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
            image.backgroundColor = [UIColor redColor];
            image;
        })];
        [self addSubview:_search];
    }
    return _search;
}
- (TLSegmentedControl *)segmentBar {
    if (!_segmentBar) {
        _segmentBar = [[TLSegmentedControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_search.frame), self.width, 40) titls:self.titles delegate:self];
        _segmentBar.spacing = 20;
        _segmentBar.padding = UIEdgeInsetsMake(12, 0, 8, 0);
        _segmentBar.pageWidth = self.width;
        _segmentBar.indicatorBarSize = CGSizeMake(15, 3);
        _segmentBar.indicatorBarColor = @[(id)[UIColor orangeColor].CGColor,(id)[UIColor redColor].CGColor];
        [self addSubview:_segmentBar];
    }
    return _segmentBar;
}
- (UIButton *)seg {
    if (!_seg) {
        _seg = [UIButton buttonWithType:UIButtonTypeCustom];
        _seg.backgroundColor = [UIColor redColor];
        _seg.frame = CGRectMake(ScreenWidth - 30, CGRectGetMaxY(_search.frame), 30, 40);
        [self addSubview:_seg];
    }
    return _seg;
}

#pragma mark - 动画
/// 显示
- (void)show {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _search.top = StatusBarHeight;
        _search.alpha = 1;
        _segmentBar.top = StatusBarHeight + 40;
        _seg.top = StatusBarHeight + 40;
        self.height = StatusBarHeight + 80;
    } completion:^(BOOL finished) {
        
    }];
}
/// 隐藏
- (void)hide {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _search.top = StatusBarHeight - 40;
        _search.alpha = 0;
        _segmentBar.top = StatusBarHeight;
        _seg.top = StatusBarHeight;
        self.height = StatusBarHeight + 40;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - 设置
- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    [self segmentBar];
    [self seg];
}

#pragma mark - TLSegmentedControlDelegate
- (void)segmentedControl:(TLSegmentedControl *)segmentedControl didSelectIndex:(NSUInteger)index {
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerSegmentedControl:didSelectIndex:)]) {
        [self.delegate headerSegmentedControl:_segmentBar didSelectIndex:index];
    }
}

@end
