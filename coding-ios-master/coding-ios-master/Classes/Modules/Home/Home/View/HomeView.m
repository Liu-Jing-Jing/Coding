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
#import "HomeService.h"
#import "ColumnView.h"

#pragma mark - 声明
@interface HomeView()<UICollectionViewDataSource, HomeCollectionLayoutDelegate>

@property (nonatomic, strong) HomeHeader *header;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) HomeCollectionLayout *layout;
@property (nonatomic, strong) ColumnView *column;   // 栏目

@end

#pragma mark - 实现
@implementation HomeView

#pragma mark - 初始化
+ (instancetype)init {
    HomeView *view = [HomeView loadCode:ScreenBounds];
    [view collection];
    [view header];
    [view.collection.mj_header beginRefreshing];
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
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithNormalRefreshingSEL:self refreshingAction:@selector(headerRefreshing)];
            header.ignoredScrollViewContentInsetTop = ScreenWidth / 2;
            header;
        });
        [_collection setDelegate:self.layout];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:ColorBg];
        [_collection setContentInset:UIEdgeInsetsMake(ScreenWidth / 2, 0, 0, 0)];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection registerClass:[HomeSectionCategoryHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeSectionCategoryHeader"];
        [_collection registerClass:[HomeSectionNextHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeSectionNextHeader"];
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView"];
        [_collection registerClass:[HomeSectionFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HomeSectionFooter"];
        [_collection registerClass:[HomeCollectionTechnicalCell class] forCellWithReuseIdentifier:@"HomeCollectionTechnicalCell"];
        [_collection registerClass:[HomeCollectionCategoryCell class] forCellWithReuseIdentifier:@"HomeCollectionCategoryCell"];
        [_collection registerClass:[HomeCollectionHotCell class] forCellWithReuseIdentifier:@"HomeCollectionHotCell"];
        [self addSubview:_collection];
    }
    return _collection;
}
- (ColumnView *)column {
    if (!_column) {
        _column = [ColumnView init];
        [[UIApplication sharedApplication].keyWindow addSubview:_column];
    }
    return _column;
}

- (void)headerRefreshing {
    MJWeakSelf
    [HomeService serviceRequest:^(HomeModel *model) {
        [weakSelf setModel:model];
        [weakSelf.collection.mj_header endRefreshing];
        [weakSelf.collection.mj_footer endRefreshing];
    } error:^(NSError *error) {
        
    }];
}
- (void)footerRefreshing {
    MJWeakSelf
    [HomeService serviceRequest:^(HomeModel *model) {
        [weakSelf setModel:model];
        [weakSelf.collection.mj_header endRefreshing];
        [weakSelf.collection.mj_footer endRefreshing];
    } error:^(NSError *error) {
        
    }];
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
        return _model.hot.count;
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
        cell.model = _model.hot[indexPath.row];
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
            MJWeakSelf
            HomeSectionCategoryHeader *header = [HomeSectionCategoryHeader initWithCollection:collectionView kind:kind index:indexPath];
            [header createSubView:@[@"最新", @"Web前端", @"iOS", @"Android"]];
            [header.icon addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
                [weakSelf.column show];
            }];
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
        if (indexPath.section == 1) {
            HomeSectionFooter *footer = [HomeSectionFooter initWithCollection:collectionView kind:kind index:indexPath];
            return footer;
        } else {
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
            return footer;
        }
    }
    return nil;
}





@end
