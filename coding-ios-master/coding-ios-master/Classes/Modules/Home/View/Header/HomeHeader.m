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

+ (instancetype)initWithFrame:(CGRect)frame {
    HomeHeader *view = [HomeHeader loadCode:frame];
    view.backgroundColor = LightColor;
    [view scroll];
    return view;
}
- (SDCycleScrollView *)scroll {
    if (!_scroll) {
        UIImage *image2 = [UIImage createImageWithColor:MediumColor];
        UIImage *image3 = [UIImage createImageWithColor:BoldColor];
        UIImage *image4 = [UIImage createImageWithColor:HeavyColor];
        
        _scroll = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageNamesGroup:@[image2,image3,image4]];
        _scroll.currentPageDotColor = LightColor;
        _scroll.pageDotColor = ThinColor;
        [self addSubview:_scroll];
    }
    return _scroll;
}

@end
