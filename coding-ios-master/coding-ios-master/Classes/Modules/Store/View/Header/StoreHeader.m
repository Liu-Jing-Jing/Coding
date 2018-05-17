//
//  StoreHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreHeader.h"
#import "TLSegmentedControl.h"

#define SearchHeight 30
#define SegmentBarHeight 30

#pragma mark - 声明
@interface StoreHeader()<TLSegmentedControlDelegate, UITextFieldDelegate>


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
    [self setBackgroundColor:ColorTextBold];
    [self search];
    [self cancle];
    [self setHeight:SearchHeight + SegmentBarHeight + StatusBarHeight];
    [self ritl_addBorderWithColor:ColorTextBold BodrerWidth:1.0 direction:RITLBorderDirectionBottom];
}
- (UITextField *)search {
    if (!_search) {
        _search = [[UITextField alloc] initWithFrame:({
            CGFloat left = countcoordinatesX(15);
            CGFloat width = ScreenWidth - left * 2;
            CGFloat height = 30;
            CGFloat top = (SearchHeight - height) / 2;
            CGRectMake(left, StatusBarHeight + top, width, height);
        })];
        [_search setDelegate:self];
        [_search setBackgroundColor:[UIColor whiteColor]];
        [_search setPlaceholder:@"搜索音乐"];
        [_search setFont:[UIFont systemFontOfSize:adjustFont(12)]];
        [_search setLeftViewMode:UITextFieldViewModeAlways];
        [_search.layer setCornerRadius:5];
        [_search.layer setMasksToBounds:YES];
        [_search setLeftView:({
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 13)];
            image.image = [UIImage imageNamed:@"search_in_12x12_"];
            image.contentMode = UIViewContentModeScaleAspectFit;
            image;
        })];
        [_search setReturnKeyType:UIReturnKeySearch];
        [self addSubview:_search];
    }
    return _search;
}
- (UIButton *)cancle {
    if (!_cancle) {
        __weak typeof(self) weak = self;
        _cancle = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancle.frame = ({
            CGFloat left = countcoordinatesX(15);
            CGFloat width = ScreenWidth - left * 2;
            CGFloat cancleW = ScreenWidth - width - left;
            CGRectMake(ScreenWidth, _search.top, cancleW + 30, 30);
        });
        [_cancle.titleLabel setFont:[UIFont systemFontOfSize:adjustFont(16)]];
        [_cancle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancle setTitle:@"取消" forState:UIControlStateNormal];
        [_cancle addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak.search endEditing:YES];
        }];
        [self addSubview:_cancle];
    }
    return _cancle;
}
- (TLSegmentedControl *)segmentBar {
    if (!_segmentBar) {
        _segmentBar = [[TLSegmentedControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_search.frame), self.width, SegmentBarHeight) titls:self.titles delegate:self];
        _segmentBar.spacing = 20;
        _segmentBar.padding = UIEdgeInsetsMake(8, 0, 2, 0);
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
        _seg.frame = CGRectMake(ScreenWidth - 30, CGRectGetMaxY(_search.frame), 25, SegmentBarHeight);
        _seg.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_seg setImage:[UIImage imageNamed:@"btn_menu"] forState:UIControlStateNormal];
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
        _segmentBar.top = CGRectGetMaxY(_search.frame);
        _seg.top = CGRectGetMaxY(_search.frame);
        self.height = StatusBarHeight + SearchHeight + SegmentBarHeight;
    } completion:^(BOOL finished) {
        
    }];
}
/// 隐藏
- (void)hide {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _search.top = StatusBarHeight - SearchHeight;
        _search.alpha = 0;
        _segmentBar.top = StatusBarHeight;
        _seg.top = StatusBarHeight;
        self.height = StatusBarHeight + SegmentBarHeight;
    } completion:^(BOOL finished) {
        
    }];
}
/// 显示搜索
- (void)showSearch {
    [UIView animateWithDuration:.2f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGFloat width = ScreenWidth - countcoordinatesX(15) * 2;
        _search.width = width - 30;
        _cancle.left = CGRectGetMaxX(_search.frame);
    } completion:^(BOOL finished) {
        
    }];
}
/// 隐藏搜索
- (void)hideSearch {
    [UIView animateWithDuration:.2f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _search.width = ScreenWidth - countcoordinatesX(15) * 2;
        _cancle.left = ScreenWidth;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - UITextFieldDelegate
// 开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self showSearch];
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerBeginSearch:)]) {
        [self.delegate headerBeginSearch:textField];
    }
    return YES;
}
// 停止编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [self hideSearch];
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerEndSearch:)]) {
        [self.delegate headerEndSearch:textField];
    }
    return YES;
}
// 点击return键
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerReturn:)]) {
        [self.delegate headerReturn:textField];
    }
    return YES;
}

#pragma mark - 设置
- (void)setTitles:(NSArray<LRLChannelUnitModel *> *)titles {
    _titles = titles;
    [_segmentBar removeFromSuperview];
    _segmentBar = nil;
    [_seg removeFromSuperview];
    _seg = nil;
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
