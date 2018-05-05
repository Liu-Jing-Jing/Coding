//
//  CarouselView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "CarouselView.h"

#pragma mark - 声明
@interface CarouselView()

@property (nonatomic, strong) SDCycleScrollView *cycle;

@end

#pragma mark - 实现
@implementation CarouselView

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    CarouselView *view = [CarouselView loadCode:frame];
    [view cycle];
    return view;
}
- (SDCycleScrollView *)cycle {
    if (!_cycle) {
        _cycle = [SDCycleScrollView initWithFrame:self.bounds];
        [self addSubview:_cycle];
    }
    return _cycle;
}
- (void)setImages:(NSArray *)images {
    _images = images;
    _cycle.imageURLStringsGroup = images;
}

@end
