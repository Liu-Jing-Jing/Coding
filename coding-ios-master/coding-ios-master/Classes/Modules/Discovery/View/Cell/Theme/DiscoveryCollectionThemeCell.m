//
//  DiscoveryCollectionThemeCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryCollectionThemeCell.h"
#import "DiscoveryCollectionThemeView.h"

#pragma mark - 声明
@interface DiscoveryCollectionThemeCell()

@property (nonatomic, strong) UIScrollView *scroll;

@end

#pragma mark - 实现
@implementation DiscoveryCollectionThemeCell

#pragma mark - 设置
- (void)setModels:(NSArray<NSString *> *)models {
    _models = models;
    [self createView];
}

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    DiscoveryCollectionThemeCell *cell = [DiscoveryCollectionThemeCell loadCode:collection index:index];
    [cell setBackgroundColor:WhiteColor];
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
        DiscoveryCollectionThemeView *view = [DiscoveryCollectionThemeView initWithFrame:({
            CGFloat padding = countcoordinatesX(10);
            CGFloat width = ScreenWidth - padding * 3;
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

@end
