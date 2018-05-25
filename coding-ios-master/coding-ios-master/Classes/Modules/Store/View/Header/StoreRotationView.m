//
//  StoreRotationView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreRotationView.h"

#pragma mark - 声明
@interface StoreRotationView ()

@property (nonatomic, strong) CarouselView *carousel;

@end

#pragma mark - 实现
@implementation StoreRotationView

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    StoreRotationView *view = [StoreRotationView loadCode:frame];
    [view carousel];
    return view;
}
- (void)createView {
    [self carousel];
}
- (CarouselView *)carousel {
    if (!_carousel) {
        _carousel = [CarouselView initWithFrame:self.bounds];
        [self addSubview:_carousel];
    }
    return _carousel;
}

#pragma mark - 设置
- (void)setImages:(NSArray<StoreSubModel *> *)images {
    _images = images;
    NSMutableArray *imgs = [[NSMutableArray alloc] init];
    for (StoreSubModel *model in images) {
        [imgs addObject:model.icon_big];
    }
    _carousel.images = imgs;
}



@end
