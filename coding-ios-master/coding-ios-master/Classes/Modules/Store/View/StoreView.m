//
//  StoreView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/3.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreView.h"
#import "StoreHeader.h"
#import "StoreScroll.h"
#import "StoreCollection.h"

#pragma mark - 声明
@interface StoreView ()<StoreHeaderDelegate, StoreScrollDelegate>

// 头视图
@property (nonatomic, strong) StoreHeader *header;
// 内容
@property (nonatomic, strong) StoreScroll *content;
// 文本
@property (nonatomic, strong) NSMutableArray<NSString *> *titles;

@end

#pragma mark - 实现
@implementation StoreView

#pragma mark - 初始化
+ (instancetype)init {
    StoreView *view = [[StoreView alloc] initWithFrame:ScreenBounds];
    [view createView];
    return view;
}
- (void)createView {
    [self header];
    [self content];
}
- (StoreHeader *)header {
    if (!_header) {
        _header = [StoreHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        _header.delegate = self;
        _header.titles = self.titles;
        [self addSubview:_header];
    }
    return _header;
}
- (StoreScroll *)content {
    if (!_content) {
        _content = [StoreScroll initWithFrame:({
            CGFloat left = 0;
            CGFloat top = CGRectGetMaxY(_header.frame);
            CGFloat width = ScreenWidth;
            CGFloat height = self.height - top - TabbarHeight;
            CGRectMake(left, top, width, height);
        })];
        _content.delegate = self;
        _content.titles = self.titles;
        [self addSubview:_content];
    }
    return _content;
}
- (NSMutableArray<NSString *> *)titles {
    if (!_titles) {
        _titles = [[NSMutableArray alloc] init];
        [_titles addObject:@"精选"];
        [_titles addObject:@"男生"];
        [_titles addObject:@"女生"];
        [_titles addObject:@"出版"];
        [_titles addObject:@"免费"];
    }
    return _titles;
}

#pragma mark - StoreHeaderDelegate
- (void)headerSegmentedControl:(TLSegmentedControl *)segmentedControl didSelectIndex:(NSUInteger)index {
    self.content.pageScrollView.contentOffset = CGPointMake(index * self.width, 0);
}

#pragma mark - StoreScrollDelegate
- (void)contentScrollViewDidScroll:(UIScrollView *)scrollView {
    self.header.segmentBar.offsetX = scrollView.contentOffset.x;
}
- (void)contentScrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    self.header.segmentBar.index = index;
}

// 向上/向下滚动
- (void)contentScrollViewDidScroll:(UIScrollView *)scroll isDown:(BOOL)isDown {
    // 向下滚动
    if (isDown == YES) {
        [_header show];
        [_content show];
    }
    // 向上滚动
    else {
        [_header hide];
        [_content hide];
    }
}

@end





