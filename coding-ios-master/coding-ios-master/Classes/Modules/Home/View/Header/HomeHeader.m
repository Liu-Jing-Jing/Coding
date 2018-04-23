//
//  HomeHeaderView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeader.h"

#pragma mark - 声明
@interface HomeHeader()

@property (nonatomic, strong) SDCycleScrollView *scroll;

@end

#pragma mark - 实现
@implementation HomeHeader

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    HomeHeader *view = [HomeHeader loadCode:frame];
    view.backgroundColor = LightColor;
    [view scroll];
    return view;
}
- (SDCycleScrollView *)scroll {
    if (!_scroll) {
        _scroll = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageNamesGroup:@[]];
        _scroll.currentPageDotColor = LightColor;
        _scroll.pageDotColor = ThinColor;
        [self addSubview:_scroll];
    }
    return _scroll;
}

#pragma mark - 设置
- (void)setModels:(NSArray<HomeAdModel *> *)models {
    _models = models;
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (HomeAdModel *model in models) {
        [arr addObject:model.image];
    }
    _scroll.imageURLStringsGroup = arr;
}

@end
