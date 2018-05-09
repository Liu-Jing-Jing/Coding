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
#import "LRLChannelEditController.h"
#import "LRLChannelUnitModel.h"

#pragma mark - 声明
@interface StoreView ()<StoreHeaderDelegate, StoreScrollDelegate>

// 头视图
@property (nonatomic, strong) StoreHeader *header;
// 内容
@property (nonatomic, strong) StoreScroll *content;
// 文本
@property (nonatomic, strong) NSMutableArray<LRLChannelUnitModel *> *titles;

@property (nonatomic, strong) NSMutableArray *topChannelArr;
@property (nonatomic, strong) NSMutableArray *bottomChannelArr;
@property (nonatomic, assign) NSInteger chooseIndex;

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
- (NSMutableArray *)topChannelArr {
    if (!_topChannelArr) {
        _topChannelArr = [NSMutableArray arrayWithArray:[NSArray getTopChannelArr]];
    }
    return _topChannelArr;
}
- (NSMutableArray *)bottomChannelArr {
    if (!_bottomChannelArr) {
        _bottomChannelArr = [NSMutableArray arrayWithArray:[NSArray getBottomChannelArr]];
    }
    return _bottomChannelArr;
}
- (StoreHeader *)header {
    if (!_header) {
        _header = [StoreHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        _header.delegate = self;
        _header.titles = self.titles;
        [_header.seg addTarget:self action:@selector(pushController) forControlEvents:UIControlEventTouchUpInside];
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
- (NSMutableArray<LRLChannelUnitModel *> *)titles {
    if (!_titles) {
        _titles = [NSMutableArray arrayWithArray:[NSArray getTopChannelArr]];
    }
    return _titles;
}


- (void)pushController {
    __weak typeof(self) weak = self;
    LRLChannelEditController *channelEdit = [[LRLChannelEditController alloc] initWithTopDataSource:weak.topChannelArr andBottomDataSource:weak.bottomChannelArr andInitialIndex:weak.chooseIndex];
    channelEdit.fixedCount = 2;
    
    channelEdit.removeInitialIndexBlock = ^(NSMutableArray<LRLChannelUnitModel *> *topArr, NSMutableArray<LRLChannelUnitModel *> *bottomArr){
        [weak setTopChannelArr:topArr];
        [weak setBottomChannelArr:bottomArr];
        [weak.header setTitles:topArr];
        [weak.header.seg addTarget:self action:@selector(pushController) forControlEvents:UIControlEventTouchUpInside];
        [weak.content setTitles:topArr];
        NSLog(@"删除了初始选中项的回调:\n保留的频道有: %@", topArr);
    };
    channelEdit.chooseIndexBlock = ^(NSInteger index, NSMutableArray<LRLChannelUnitModel *> *topArr, NSMutableArray<LRLChannelUnitModel *> *bottomArr){
        weak.topChannelArr = topArr;
        weak.bottomChannelArr = bottomArr;
        weak.chooseIndex = index;
        NSLog(@"选中了某一项的回调:\n保留的频道有: %@, 选中第%ld个频道", topArr, index);
    };
    [self.viewController presentViewController:channelEdit animated:YES completion:nil];
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





