//
//  DiscoveryCollectionRecommendCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryCollectionRecommendCell.h"
#import "DiscoveryCollectionRecommendView.h"

#pragma mark - 声明
@interface DiscoveryCollectionRecommendCell()

@property (nonatomic, strong) UIScrollView *scroll;

@end

#pragma mark - 实现
@implementation DiscoveryCollectionRecommendCell

#pragma mark - 设置
- (void)setModels:(NSArray<DiscoveryRecommendModel *> *)models {
    _models = models;
    [self createView];
}


#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    DiscoveryCollectionRecommendCell *cell = [DiscoveryCollectionRecommendCell loadCode:collection index:index];
    [cell setBackgroundColor:ColorBg];
    [cell scroll];
    return cell;
}
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scroll.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:_scroll];
    }
    return _scroll;
}
- (void)createView {
    for (int i=0; i<_models.count; i++) {
        DiscoveryCollectionRecommendView *view = [DiscoveryCollectionRecommendView initWithFrame:({
            CGFloat padding = countcoordinatesX(10);
            CGFloat width = ScreenWidth / 3;
            CGFloat left = (padding + width) * i + padding;
            CGFloat top = countcoordinatesX(10);
            CGFloat height = self.height - top * 2;
            CGRectMake(left, top, width, height);
        })];
        [view.icon setWithImageURL:_models[0].image options:SDWebImageDownloaderLowPriority progress:nil completion:nil];
        [view setBackgroundColor:MediumColor];
        [self.scroll addSubview:view];
        [self.scroll setContentSize:CGSizeMake(CGRectGetMaxX(view.frame) + countcoordinatesX(10), 0)];
    }
}

@end
