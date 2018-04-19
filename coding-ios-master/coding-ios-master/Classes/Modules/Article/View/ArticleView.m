//
//  ArticleView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleView.h"
#import "ArticleHeader.h"
#import "ArticleSectionHeader.h"
#import "ArticleCollectionLayout.h"
#import "HomeCollectionOtherCell.h"
#import "ArticleCollectionCell.h"

#pragma mark - 声明
@interface ArticleView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ArticleHeader *header;
@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation ArticleView

#pragma mark - 初始化
+ (instancetype)init {
    ArticleView *view = [ArticleView loadCode:ScreenBounds];
    [view header];
    [view collection];
    return view;
}
- (ArticleHeader *)header {
    if (!_header) {
        _header = [ArticleHeader initWithFrame:CGRectMake(0, -ScreenWidth / 3, ScreenWidth, ScreenWidth / 3)];
        [self.collection addSubview:_header];
    }
    return _header;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - NavigationBarHeight - TabbarHeight) collectionViewLayout:({
            [[ArticleCollectionLayout alloc] init];
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
        _collection.mj_footer = ({
            MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithNormalRefreshing:^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [_collection.mj_footer endRefreshing];
                });
            }];
            footer;
        });
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:ThinColor];
        [_collection setContentInset:UIEdgeInsetsMake(ScreenWidth / 3, 0, 0, 0)];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection registerClass:[HomeCollectionOtherCell class] forCellWithReuseIdentifier:@"HomeCollectionOtherCell"];
        [_collection registerClass:[ArticleSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ArticleSectionHeader"];
        [_collection registerClass:[ArticleCollectionCell class] forCellWithReuseIdentifier:@"ArticleCollectionCell"];
        [self addSubview:_collection];
    }
    return _collection;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
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
        HomeCollectionOtherCell *cell = [HomeCollectionOtherCell initWithCollection:collectionView index:indexPath];
        return cell;
    } else if (indexPath.section == 1) {
        ArticleCollectionCell *cell = [ArticleCollectionCell initWithCollection:collectionView index:indexPath];
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
            ArticleSectionHeader *header = [ArticleSectionHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
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
