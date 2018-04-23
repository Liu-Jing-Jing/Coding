//
//  HomeView.m
//  iOS
//
//  Created by 郑业强 on 2018/4/1.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "HomeView.h"
#import "HomeHeader.h"
#import "HomeSectionCategoryHeader.h"
#import "HomeSectionNextHeader.h"
#import "HomeSectionFooter.h"
#import "HomeCollectionTechnicalCell.h"
#import "HomeCollectionCategoryCell.h"
#import "HomeCollectionHotCell.h"
#import "HomeCollectionLayout.h"

#pragma mark - 声明
@interface HomeView()<UICollectionViewDataSource, HomeCollectionLayoutDelegate>

@property (nonatomic, strong) HomeHeader *header;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) HomeCollectionLayout *layout;

@end

#pragma mark - 实现
@implementation HomeView

#pragma mark - 初始化
+ (instancetype)init {
    HomeView *view = [HomeView loadCode:ScreenBounds];
    [view collection];
    [view header];
    return view;
}
- (HomeHeader *)header {
    if (!_header) {
        _header = [HomeHeader initWithFrame:CGRectMake(0, -ScreenWidth / 2, ScreenWidth, ScreenWidth / 2)];
        [self.collection addSubview:_header];
    }
    return _header;
}
- (HomeCollectionLayout *)layout {
    if (!_layout) {
        _layout = [[HomeCollectionLayout alloc] init];
        _layout.delegate = self;
    }
    return _layout;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - NavigationBarHeight - TabbarHeight) collectionViewLayout:self.layout];
        _collection.mj_header = ({
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithNormalRefreshing:^{
                if (self.delegate && [self.delegate respondsToSelector:@selector(homeHeaderRefreshing)]) {
                    [self.delegate homeHeaderRefreshing];
                } else {
                    [_collection.mj_header endRefreshing];
                }
            }];
            header.ignoredScrollViewContentInsetTop = ScreenWidth / 2;
            header;
        });
        [_collection setDelegate:self.layout];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:ThinColor];
        [_collection setContentInset:UIEdgeInsetsMake(ScreenWidth / 2, 0, 0, 0)];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection registerClass:[HomeSectionCategoryHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeSectionCategoryHeader"];
        [_collection registerClass:[HomeSectionNextHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeSectionNextHeader"];
        [_collection registerClass:[HomeSectionFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HomeSectionFooter"];
        [_collection registerClass:[HomeCollectionTechnicalCell class] forCellWithReuseIdentifier:@"HomeCollectionTechnicalCell"];
        [_collection registerClass:[HomeCollectionCategoryCell class] forCellWithReuseIdentifier:@"HomeCollectionCategoryCell"];
        [_collection registerClass:[HomeCollectionHotCell class] forCellWithReuseIdentifier:@"HomeCollectionHotCell"];
        [self addSubview:_collection];
    }
    return _collection;
}
- (void)endHeaderRefreshing {
    [_collection.mj_header endRefreshing];
}
- (void)endFooterRefreshing {
    [_collection.mj_footer endRefreshing];
}

#pragma mark - 设置
- (void)setModel:(HomeModel *)model {
    _model = model;
    [_collection reloadData];
    _header.models = model.ad;
}

#pragma mark - HomeCollectionLayoutDelegate
- (void)homeCollection:(UICollectionView *)collection didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeCollection:didSelectItemAtIndexPath:)]) {
        [self.delegate homeCollection:collection didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _model ? 4 : 0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    else if (section == 1) {
        return _model.sort.count;
    }
    else if (section == 2) {
        return _model.recommend.count;
    }
    else if (section == 3) {
        return 4;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeCollectionTechnicalCell *cell = [HomeCollectionTechnicalCell initWithCollection:collectionView index:indexPath];
        cell.model = _model.technical[indexPath.row];
        return cell;
    }
    else if (indexPath.section == 1) {
        HomeCollectionCategoryCell *cell = [HomeCollectionCategoryCell initWithCollection:collectionView index:indexPath];
        cell.sortModel = _model.sort[indexPath.row];
        return cell;
    }
    else if (indexPath.section == 2) {
        HomeCollectionCategoryCell *cell = [HomeCollectionCategoryCell initWithCollection:collectionView index:indexPath];
        cell.recommendModel = _model.recommend[indexPath.row];
        return cell;
    }
    else if (indexPath.section == 3) {
        HomeCollectionHotCell *cell = [HomeCollectionHotCell initWithCollection:collectionView index:indexPath];
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
            HomeSectionCategoryHeader *header = [HomeSectionCategoryHeader initWithCollection:collectionView kind:kind index:indexPath];
            return header;
        }
        else if (indexPath.section == 2) {
            HomeSectionNextHeader *header = [HomeSectionNextHeader initWithCollection:collectionView kind:kind index:indexPath];
            header.headerStr = _model.sectionHeader[0];
            return header;
        }
        else if (indexPath.section == 3) {
            HomeSectionNextHeader *header = [HomeSectionNextHeader initWithCollection:collectionView kind:kind index:indexPath];
            header.headerStr = _model.sectionHeader[1];
            return header;
        }
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        HomeSectionFooter *footer = [HomeSectionFooter initWithCollection:collectionView kind:kind index:indexPath];
        return footer;
    }
    return nil;
}






@end
