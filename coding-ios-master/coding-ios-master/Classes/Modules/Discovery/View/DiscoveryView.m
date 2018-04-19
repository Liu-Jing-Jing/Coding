//
//  DiscoveryView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryView.h"
#import "DiscoveryHeader.h"
#import "DiscoverySectionHeader.h"
#import "DiscoveryCollectionLayout.h"
#import "DiscoveryCollectionHotCell.h"
#import "DiscoveryCollectionRecommendCell.h"
#import "DiscoveryCollectionThemeCell.h"
#import "DiscoveryCollectionListCell.h"

#pragma mark - 声明
@interface DiscoveryView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) DiscoveryHeader *header;
@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation DiscoveryView

+ (instancetype)init {
    DiscoveryView *view = [DiscoveryView loadCode:ScreenBounds];
    [view header];
    [view collection];
    return view;
}
- (DiscoveryHeader *)header {
    if (!_header) {
        _header = [DiscoveryHeader initWithFrame:CGRectMake(0, -ScreenWidth / 3, ScreenWidth, ScreenWidth / 3)];
        [self.collection addSubview:_header];
    }
    return _header;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - NavigationBarHeight - TabbarHeight) collectionViewLayout:({
            [[DiscoveryCollectionLayout alloc] init];
        })];
        _collection.mj_header = ({
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithNormalRefreshing:^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [_collection.mj_header endRefreshing];
                });
            }];
            header.ignoredScrollViewContentInsetTop = ScreenWidth / 3;
            header;
        });
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:ThinColor];
        [_collection setContentInset:UIEdgeInsetsMake(ScreenWidth / 3, 0, 0, 0)];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection registerClass:[DiscoveryCollectionHotCell class] forCellWithReuseIdentifier:@"DiscoveryCollectionHotCell"];
        [_collection registerClass:[DiscoveryCollectionRecommendCell class] forCellWithReuseIdentifier:@"DiscoveryCollectionRecommendCell"];
        [_collection registerClass:[DiscoveryCollectionThemeCell class] forCellWithReuseIdentifier:@"DiscoveryCollectionThemeCell"];
        [_collection registerClass:[DiscoveryCollectionListCell class] forCellWithReuseIdentifier:@"DiscoveryCollectionListCell"];
        [_collection registerClass:[DiscoverySectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DiscoverySectionHeader"];
        [self addSubview:_collection];
    }
    return _collection;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 1;
    }
    else if (section == 2) {
        return 1;
    }
    else if (section == 3) {
        return 6;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DiscoveryCollectionHotCell *cell = [DiscoveryCollectionHotCell initWithCollection:collectionView index:indexPath];
        return cell;
    }
    else if (indexPath.section == 1) {
        DiscoveryCollectionRecommendCell *cell = [DiscoveryCollectionRecommendCell initWithCollection:collectionView index:indexPath];
        return cell;
    }
    else if (indexPath.section == 2) {
        DiscoveryCollectionThemeCell *cell = [DiscoveryCollectionThemeCell initWithCollection:collectionView index:indexPath];
        return cell;
    }
    else if (indexPath.section == 3) {
        DiscoveryCollectionListCell *cell = [DiscoveryCollectionListCell initWithCollection:collectionView index:indexPath];
        return cell;
    }
    return nil;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0) {
            return nil;
        }
        else if (indexPath.section == 1) {
            DiscoverySectionHeader *header = [DiscoverySectionHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
            return header;
        }
        else if (indexPath.section == 2) {
            DiscoverySectionHeader *header = [DiscoverySectionHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
            return header;
        }
        else if (indexPath.section == 3) {
            DiscoverySectionHeader *header = [DiscoverySectionHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
            return header;
        }
    }
    return nil;
}
// Header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeZero;
    }
    else if (section == 1) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
    }
    else if (section == 2) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
    }
    else if (section == 3) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
    }
    return CGSizeZero;
}
//// Footer
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return CGSizeZero;
//    }
//    else if (section == 1) {
//        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
//    }
//    else if (section == 2) {
//        return CGSizeZero;
//    }
//    else if (section == 3) {
//        return CGSizeZero;
//    }
//    return CGSizeZero;
//}
// Section内间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    else if (section == 1) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    else if (section == 2) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    else if (section == 3) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return UIEdgeInsetsZero;
}

#pragma mark - UICollectionViewDelegateFlowLayout
// Cell尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenWidth, ScreenWidth / 5);
    }
    else if (indexPath.section == 1) {
        return CGSizeMake(ScreenWidth, ScreenWidth / 3);
    }
    else if (indexPath.section == 2) {
        return CGSizeMake(ScreenWidth, ScreenWidth / 4);
    }
    else if (indexPath.section == 3) {
        return CGSizeMake(ScreenWidth, ScreenWidth / 4);
    }
    return CGSizeZero;
}
// Cell间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    else if (section == 1) {
        return 0;
    }
    else if (section == 2) {
        return 0;
    }
    else if (section == 3) {
        return 0;
    }
    return 0;
}
// Section间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end

