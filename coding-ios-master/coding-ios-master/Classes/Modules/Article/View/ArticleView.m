//
//  ArticleView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleView.h"
#import "ArticleHeader.h"
#import "SectionHeader.h"
#import "ArticleCollectionLayout.h"
#import "HomeCollectionTechnicalCell.h"
#import "ArticleCollectionNameCell.h"
#import "ArticleCollectionIconCell.h"
#import "ArticleService.h"

#pragma mark - 声明
@interface ArticleView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ArticleHeader *header;
@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation ArticleView

#pragma mark - 设置
- (void)setModel:(ArticleModel *)model {
    _model = model;
    [_collection reloadData];
    _header.models = model.ad;
}

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
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithNormalRefreshingSEL:self refreshingAction:@selector(headerRefreshing)];
            header.ignoredScrollViewContentInsetTop = self.header.height;
            header;
        });
        _collection.mj_footer = [MJRefreshBackNormalFooter footerWithNormalRefreshingSEL:self refreshingAction:@selector(footerRefreshing)];
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:ThinColor];
        [_collection setContentInset:UIEdgeInsetsMake(ScreenWidth / 3, 0, 0, 0)];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection registerClass:[HomeCollectionTechnicalCell class] forCellWithReuseIdentifier:@"HomeCollectionTechnicalCell"];
        [_collection registerClass:[SectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SectionHeader"];
        [_collection registerNib:[UINib nibWithNibName:@"ArticleCollectionNameCell" bundle:nil] forCellWithReuseIdentifier:@"ArticleCollectionNameCell"];
        [_collection registerNib:[UINib nibWithNibName:@"ArticleCollectionIconCell" bundle:nil] forCellWithReuseIdentifier:@"ArticleCollectionIconCell"];
        [self addSubview:_collection];
    }
    return _collection;
}


- (void)headerRefreshing {
    MJWeakSelf
    [ArticleService serviceRequestWithPage:1 success:^(ArticleModel *model) {
        [weakSelf setModel:model];
        [weakSelf.collection.mj_header endRefreshing];
        [weakSelf.collection.mj_footer endRefreshing];
    } error:^(NSError *error) {
        
    }];
}
- (void)footerRefreshing {
    MJWeakSelf
    [ArticleService serviceRequestWithPage:1 success:^(ArticleModel *model) {
        [weakSelf setModel:model];
        [weakSelf.collection.mj_header endRefreshing];
        [weakSelf.collection.mj_footer endRefreshing];
    } error:^(NSError *error) {
        
    }];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _model ? 2 : 0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return _model.technical.count;
    }
    else if (section == 1) {
        return _model.article.count;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeCollectionTechnicalCell *cell = [HomeCollectionTechnicalCell initWithCollection:collectionView index:indexPath];
        cell.model = _model.technical[indexPath.row];
        return cell;
    } else if (indexPath.section == 1) {
        if (_model.article[indexPath.row].type == 0) {
            ArticleCollectionIconCell *cell = [ArticleCollectionIconCell initWithCollection:collectionView index:indexPath];
            cell.model = _model.article[indexPath.row];
            return cell;
        } else {
            ArticleCollectionNameCell *cell = [ArticleCollectionNameCell initWithCollection:collectionView index:indexPath];
            cell.model = _model.article[indexPath.row];
            return cell;
        }
    }
    return nil;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0) {
            return nil;
        }
        else if (indexPath.section == 1) {
            SectionHeader *header = [SectionHeader initWithCollection:collectionView kind:UICollectionElementKindSectionHeader index:indexPath];
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
        return CGSizeMake(ScreenWidth / 3, ScreenWidth / 3 / 5 * 3);
    }
    else if (indexPath.section == 1) {
        if (_model.article[indexPath.row].type == 1) {
            CGFloat width = ScreenWidth;
            CGFloat height = countcoordinatesY(160);
            return CGSizeMake(width, height);
        } else {
            CGFloat width = ScreenWidth;
            CGFloat height = countcoordinatesY(200);
            return CGSizeMake(width, height);
        }
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

