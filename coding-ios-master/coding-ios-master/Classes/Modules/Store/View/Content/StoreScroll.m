//
//  StoreScroll.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreScroll.h"
#import "StoreCollection.h"

#pragma mark - 声明
@interface StoreScroll()<StoreCollectionDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *contents;

@end

#pragma mark - 实现
@implementation StoreScroll

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    StoreScroll *view = [StoreScroll loadCode:frame];
    [view createView];
    return view;
}
- (void)createView {
    [self pageScrollView];
}
- (UIScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _pageScrollView.pagingEnabled = YES;
        _pageScrollView.delegate = self;
        _pageScrollView.backgroundColor = [UIColor grayColor];
        _pageScrollView.bounces = NO;
        _pageScrollView.showsVerticalScrollIndicator = NO;
        _pageScrollView.showsHorizontalScrollIndicator = NO;
        [_pageScrollView setContentSize:CGSizeMake(self.width * self.titles.count, 0)];
        [self addSubview:_pageScrollView];
    }
    return _pageScrollView;
}
- (void)setTitles:(NSArray<NSString *> *)titles {
    [self.contents removeAllObjects];
    _titles = titles;
    for (int i=0; i<titles.count; i++) {
        StoreCollection *collection = [StoreCollection initWithFrame:CGRectMake(i * _pageScrollView.width, 0, _pageScrollView.width, _pageScrollView.height)];
        collection.delegate = self;
        [_pageScrollView addSubview:collection];
        [self.contents addObject:collection];
    }
    [_pageScrollView setContentSize:CGSizeMake(ScreenWidth * titles.count, 0)];
}
- (NSMutableArray *)contents {
    if (!_contents) {
        _contents = [[NSMutableArray alloc] init];
    }
    return _contents;
}

#pragma mark - 动画
/// 显示
- (void)show {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGFloat top = StatusBarHeight + 60;
        CGFloat height = ScreenHeight - (StatusBarHeight + 60) - TabbarHeight;
        
        [self setTop:top];
        [self setHeight:height];
        [self.pageScrollView setHeight:height];
        for (StoreCollection *collection in self.contents) {
            [collection setHeight:height];
            [collection.collection setHeight:height];
        }
    } completion:^(BOOL finished) {
        
    }];
}
/// 隐藏
- (void)hide {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGFloat top = StatusBarHeight + 30;
        CGFloat height = ScreenHeight - (StatusBarHeight + 30) - TabbarHeight;
        
        [self setTop:top];
        [self setHeight:height];
        [self.pageScrollView setHeight:height];
        for (StoreCollection *collection in self.contents) {
            [collection setHeight:height];
            [collection.collection setHeight:height];
        }
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentScrollViewDidScroll:)]) {
        [self.delegate contentScrollViewDidScroll:scrollView];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentScrollViewDidEndDecelerating:)]) {
        [self.delegate contentScrollViewDidEndDecelerating:scrollView];
    }
}

#pragma mark - StoreCollectionDelegate
- (void)collectionScrollViewDidScroll:(UIScrollView *)scroll isDown:(BOOL)isDown {
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentScrollViewDidScroll:isDown:)]) {
        [self.delegate contentScrollViewDidScroll:scroll isDown:isDown];
    }
}

@end



