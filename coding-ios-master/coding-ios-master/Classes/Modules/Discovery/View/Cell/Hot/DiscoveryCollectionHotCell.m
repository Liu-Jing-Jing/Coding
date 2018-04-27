//
//  DiscoveryCollectionHotCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryCollectionHotCell.h"
#import "DiscoveryCollectionHotView.h"

#pragma mark - 声明
@interface DiscoveryCollectionHotCell()

@property (nonatomic, strong) UIScrollView *scroll;

@end

#pragma mark - 实现
@implementation DiscoveryCollectionHotCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    DiscoveryCollectionHotCell *cell = [DiscoveryCollectionHotCell loadCode:collection index:index];
    [cell setBackgroundColor:WhiteColor];
    [cell scroll];
    return cell;
}
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scroll.showsHorizontalScrollIndicator = NO;
        _scroll.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:_scroll];
    }
    return _scroll;
}
- (void)createView {
    [_scroll removeAllSubviews];
    for (int i=0; i<_models.count; i++) {
        DiscoveryCollectionHotView *view = [DiscoveryCollectionHotView initWithFrame:({
            CGFloat padding = countcoordinatesX(10);
            CGFloat width = ScreenWidth / 3;
            CGFloat left = (padding + width) * i + padding;
            CGFloat top = countcoordinatesX(10);
            CGFloat height = self.height - top * 2;
            CGRectMake(left, top, width, height);
        })];
        [view setBackgroundColor:MediumColor];
        [view.icon setWithImageURL:_models[i] options:SDWebImageDownloaderLowPriority progress:nil completion:nil];
        [self.scroll addSubview:view];
        [self.scroll setContentSize:CGSizeMake(CGRectGetMaxX(view.frame) + countcoordinatesX(10), 0)];
    }
}

- (void)setModels:(NSArray *)models {
    _models = models;
    [self createView];
}

@end
