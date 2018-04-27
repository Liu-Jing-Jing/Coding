//
//  DiscoveryView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryView.h"
#import "DiscoveryHeader.h"
#import "HomeSectionNextHeader.h"
#import "DiscoveryCollectionLayout.h"
#import "DiscoveryCollectionHotCell.h"
#import "DiscoveryCollectionRecommendCell.h"
#import "DiscoveryCollectionThemeCell.h"
#import "ArticleCollectionIconCell.h"
#import "DiscoveryService.h"

#pragma mark - 声明
@interface DiscoveryView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) DiscoveryHeader *header;
@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation DiscoveryView

+ (instancetype)init {
    DiscoveryView *view = [DiscoveryView loadCode:ScreenBounds];
    [view header];
    [view collection];
    [view.collection.mj_header beginRefreshing];
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
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithNormalRefreshingSEL:self refreshingAction:@selector(headerRefreshing)];
            header.ignoredScrollViewContentInsetTop = ScreenWidth / 3;
            header;
        });
        _collection.mj_footer = [MJRefreshBackNormalFooter footerWithNormalRefreshingSEL:self refreshingAction:@selector(footerRefreshing)];
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:ColorBg];
        [_collection setContentInset:UIEdgeInsetsMake(ScreenWidth / 3, 0, 0, 0)];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection registerClass:[DiscoveryCollectionHotCell class] forCellWithReuseIdentifier:@"DiscoveryCollectionHotCell"];
        [_collection registerClass:[DiscoveryCollectionRecommendCell class] forCellWithReuseIdentifier:@"DiscoveryCollectionRecommendCell"];
        [_collection registerClass:[DiscoveryCollectionThemeCell class] forCellWithReuseIdentifier:@"DiscoveryCollectionThemeCell"];
        [_collection registerNib:[UINib nibWithNibName:@"ArticleCollectionIconCell" bundle:nil] forCellWithReuseIdentifier:@"ArticleCollectionIconCell"];
        [_collection registerClass:[HomeSectionNextHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeSectionNextHeader"];
        [_collection registerClass:[SectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeader"];
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView"];
        [self addSubview:_collection];
    }
    return _collection;
}

- (void)headerRefreshing {
    MJWeakSelf
    [DiscoveryService serviceRequestWithPage:1 success:^(DiscoveryModel *model) {
        [weakSelf setModel:model];
        [weakSelf.collection.mj_header endRefreshing];
        [weakSelf.collection.mj_footer endRefreshing];
    } error:^(NSError *error) {
        
    }];
}
- (void)footerRefreshing {
    MJWeakSelf
    [DiscoveryService serviceRequestWithPage:1 success:^(DiscoveryModel *model) {
        [weakSelf setModel:model];
        [weakSelf.collection.mj_header endRefreshing];
        [weakSelf.collection.mj_footer endRefreshing];
    } error:^(NSError *error) {
        
    }];
}

- (void)setModel:(DiscoveryModel *)model {
    _model = model;
    _header.model = model.ad[0];
    [_collection reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _model ? 4 : 0;
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
        return _model.article.count;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DiscoveryCollectionHotCell *cell = [DiscoveryCollectionHotCell initWithCollection:collectionView index:indexPath];
        cell.models = _model.hot;
        return cell;
    }
    else if (indexPath.section == 1) {
        DiscoveryCollectionRecommendCell *cell = [DiscoveryCollectionRecommendCell initWithCollection:collectionView index:indexPath];
        cell.models = _model.recommend;
        return cell;
    }
    else if (indexPath.section == 2) {
        DiscoveryCollectionThemeCell *cell = [DiscoveryCollectionThemeCell initWithCollection:collectionView index:indexPath];
        cell.models = _model.theme;
        return cell;
    }
    else if (indexPath.section == 3) {
        ArticleCollectionIconCell *cell = [ArticleCollectionIconCell initWithCollection:collectionView index:indexPath];
        cell.model = _model.article[indexPath.row];
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
            HomeSectionNextHeader *header = [HomeSectionNextHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
            header.headerStr = _model.sectionHeader[0];
            return header;
        }
        else if (indexPath.section == 2) {
            HomeSectionNextHeader *header = [HomeSectionNextHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
            header.headerStr = _model.sectionHeader[1];
            return header;
        }
        else if (indexPath.section == 3) {
            SectionHeader *header = [SectionHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
            return header;
        }
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        if (indexPath.section == 2) {
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
            return footer;
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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(10));
    }
    return CGSizeZero;
}

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
        CGFloat height = countcoordinatesY(200);
        return CGSizeMake(ScreenWidth, height);
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

