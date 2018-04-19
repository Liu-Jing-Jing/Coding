//
//  DiscoveryView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "PushView.h"
#import "PushHeader.h"
#import "PushSectionHeader.h"
#import "PushCollectionLayout.h"
#import "PushCollectionHotCell.h"
#import "PushCollectionRecommendCell.h"
#import "PushCollectionThemeCell.h"
#import "PushCollectionListCell.h"

#pragma mark - 声明
@interface PushView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) PushHeader *header;
@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation PushView

+ (instancetype)init {
    PushView *view = [PushView loadCode:ScreenBounds];
    [view header];
    [view collection];
    return view;
}
- (PushHeader *)header {
    if (!_header) {
        _header = [PushHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 3)];
        [self.collection addSubview:_header];
    }
    return _header;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - NavigationBarHeight - TabbarHeight) collectionViewLayout:({
            [[PushCollectionLayout alloc] init];
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
        [_collection registerClass:[PushCollectionHotCell class] forCellWithReuseIdentifier:@"PushCollectionHotCell"];
        [_collection registerClass:[PushCollectionRecommendCell class] forCellWithReuseIdentifier:@"PushCollectionRecommendCell"];
        [_collection registerClass:[PushCollectionThemeCell class] forCellWithReuseIdentifier:@"PushCollectionThemeCell"];
        [_collection registerClass:[PushCollectionListCell class] forCellWithReuseIdentifier:@"PushCollectionListCell"];
        [_collection registerClass:[PushSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PushSectionHeader"];
        [self addSubview:_collection];
    }
    return _collection;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    else if (section == 1) {
        return 5;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PushCollectionHotCell *cell = [PushCollectionHotCell initWithCollection:collectionView index:indexPath];
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
            PushSectionHeader *header = [PushSectionHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
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
        return UIEdgeInsetsMake(0, 0, countcoordinatesY(10), 0);
    }
    else if (section == 1) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return UIEdgeInsetsZero;
}

#pragma mark - UICollectionViewDelegateFlowLayout
// Cell尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenWidth / 3, ScreenWidth / 3 / 2);
    }
    else if (indexPath.section == 1) {
        CGFloat width = ScreenWidth;
        CGFloat height = width / 3;
        return CGSizeMake(width, height);
    }
    return CGSizeZero;
}
// Cell间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return countcoordinatesY(10);
    }
    else if (section == 1) {
        return 0;
    }
    return 0;
}
// Section间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end

