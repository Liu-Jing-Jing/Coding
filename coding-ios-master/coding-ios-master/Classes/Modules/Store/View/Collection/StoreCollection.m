//
//  StoreCollection.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollection.h"
#import "StoreCollectionSectionHeader.h"
#import "StoreCollectionSummaryCell.h"
#import "StoreCollectionCategoryCell.h"
#import "StoreCollectionDetailCell.h"
#import "StoreCollectionLayout.h"
#import "StoreService.h"
#import "StoreModel.h"
#import "StoreRotationView.h"

#define FooterHeight countcoordinatesY(10)

#pragma mark - 声明
@interface StoreCollection()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    // 之前滚动位置;
    CGFloat _lastOffsetY;
    // 定时器
    NSTimer *_timer;
}
@property (nonatomic, strong) StoreRotationView *rotation;
@property (nonatomic, strong) CarouselView *carouse;
@property (nonatomic, strong) StoreModel *model;

@end

#pragma mark - 实现
@implementation StoreCollection

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    StoreCollection *view = [StoreCollection loadCode:frame];
    [view createView];
    return view;
}
- (void)createView {
    [self rotation];
//    [self carouse];
    [self collection];
    [self showEmptyView:KKEmptyViewTypeLoading eventBlock:nil];
}
- (StoreRotationView *)rotation {
    if (!_rotation) {
        _rotation = [StoreRotationView initWithFrame:({
            CGFloat height = ScreenWidth / 5 * 2;
            CGRectMake(0, -height - FooterHeight, ScreenWidth, height);
        })];
        [self.collection addSubview:_rotation];
    }
    return _rotation;
}
- (CarouselView *)carouse {
    if (!_carouse) {
        _carouse = [CarouselView initWithFrame:({
            CGFloat height = ScreenWidth / 5 * 2;
            CGRectMake(0, -height - FooterHeight, ScreenWidth, height);
        })];
        _carouse.images = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526132348&di=a55b937782ebd7c097fbcc587bbd0a80&imgtype=jpg&er=1&src=http%3A%2F%2Fpic.qiantucdn.com%2F58pic%2F17%2F86%2F17%2F559f42e68d5f0_1024.jpg",
                            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525537630756&di=af0b42045b7307b79a0b199b47baaf5f&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F013d5b56fe13946ac725794803ca4e.jpg",
                            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525537632771&di=1c24dfbb1e71ada29b1740ca9253ae67&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01b266571dd33b32f875a3996d817b.jpg%402o.jpg"];
        [self.collection addSubview:_carouse];
    }
    return _carouse;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:({
            StoreCollectionLayout *flow = [[StoreCollectionLayout alloc] init];
            flow;
        })];
        [_collection setMj_header:({
            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithNormalRefreshingSEL:self refreshingAction:@selector(headerRefresh)];
            header.ignoredScrollViewContentInsetTop = _carouse.height + FooterHeight;
            header;
        })];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:ColorBg];
        [_collection setContentInset:UIEdgeInsetsMake(self.carouse.height + FooterHeight, 0, 0, 0)];
        [_collection setContentSize:CGSizeMake(0, ScreenHeight * 2)];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionSummaryCell" bundle:nil] forCellWithReuseIdentifier:@"StoreCollectionSummaryCell"];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionCategoryCell" bundle:nil] forCellWithReuseIdentifier:@"StoreCollectionCategoryCell"];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionDetailCell" bundle:nil] forCellWithReuseIdentifier:@"StoreCollectionDetailCell"];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionSectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"StoreCollectionSectionHeader"];
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView"];
        [self addSubview:_collection];
    }
    return _collection;
}

#pragma mark - 刷新
/// 开始下拉请求
- (void)beginHeaderRefresh {
    [_collection.mj_header beginRefreshing];
    [self headerRefresh];
}
- (void)headerRefresh {
    __weak typeof(self) weak = self;
    [StoreService getStoreList:_lid complete:^(StoreModel *model, ServiceType result) {
        if (result == ServiceTypeSuccess) {
            [weak.collection.mj_header endRefreshing];
            [weak hideEmptyView];
            [weak setModel:model];
        } else if (result == ServiceTypeFail){
            [weak showEmptyView:KKEmptyViewTypeNetFail eventBlock:^(KKEmptyViewEventType eventType) {
                [weak showEmptyView:KKEmptyViewTypeLoading eventBlock:nil];
                [weak headerRefresh];
            }];
        }
    }];
}

#pragma mark - 设置
- (void)setModel:(StoreModel *)model {
    _model = model;
    _rotation.images = model.rotation;
    [_collection reloadData];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return _model.recommend.count;
    }
    else if (section == 1) {
        return _model.exclusive.count;
    }
    else if (section == 2) {
        return _model.featured.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        StoreCollectionSummaryCell *cell = [StoreCollectionSummaryCell initWithCollection:collectionView indexPath:indexPath];
        cell.model = _model.recommend[indexPath.row];
        return cell;
    }
    else if (indexPath.section == 1) {
        StoreCollectionCategoryCell *cell = [StoreCollectionCategoryCell initWithCollection:collectionView indexPath:indexPath];
        cell.model = _model.exclusive[indexPath.row];
        return cell;
    }
    else if (indexPath.section == 2) {
        StoreCollectionDetailCell *cell = [StoreCollectionDetailCell initWithCollection:collectionView indexPath:indexPath];
        cell.model = _model.featured[indexPath.row];
        return cell;
    }
    return nil;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        StoreCollectionSectionHeader *header = [StoreCollectionSectionHeader initWithCollection:collectionView indexPath:indexPath];
        [header.more addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            CategoryController *vc = [[CategoryController alloc] init];
            [self.viewController.navigationController pushViewController:vc animated:YES];
        }];
        return header;
    } else if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor clearColor];
        return footer;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CGFloat row = 3;
        CGFloat padding = countcoordinatesX(5);
        CGFloat width = (ScreenWidth - padding * (row - 1)) / row;
        return CGSizeMake(width, width + 30);
    }
    else if (indexPath.section == 1) {
        CGFloat row = 2;
        CGFloat padding = countcoordinatesX(5);
        CGFloat width = (ScreenWidth - padding * (row - 1)) / row;
        return CGSizeMake(width, width / 2 + 30);
    }
    else if (indexPath.section == 2) {
        CGFloat width = ScreenWidth;
        return CGSizeMake(width, width / 3);
    }
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, 40);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, FooterHeight);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsZero;
    }
    else if (section == 1) {
        return UIEdgeInsetsZero;
    }
    else if (section == 2) {
        return UIEdgeInsetsZero;
    }
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return FooterHeight;
    }
    else if (section == 1) {
        return countcoordinatesX(5);
    }
    else if (section == 2) {
        return 0;
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SongListController *vc = [[SongListController alloc] init];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _lastOffsetY = scrollView.contentOffset.y;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(startTimer) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
}
- (void)startTimer {
    CGFloat CanMoveH = 70;
    CGFloat scrollOffsetH = _collection.contentOffset.y - _lastOffsetY;
    // 突然滚动
    if (ABS(scrollOffsetH) > CanMoveH) {
        // 向上滚动
        if (scrollOffsetH < -CanMoveH) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionScrollViewDidScroll:isDown:)]) {
                [self.delegate collectionScrollViewDidScroll:_collection isDown:YES];
            }
        }
        // 向下滚动
        else if (scrollOffsetH > CanMoveH) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionScrollViewDidScroll:isDown:)]) {
                [self.delegate collectionScrollViewDidScroll:_collection isDown:NO];
            }
        }
    }
    // 注销
    [_timer invalidate];
    _timer = nil;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    BOOL judgment1 = scrollView.contentOffset.y < 0;
//    BOOL judgment2 = scrollView.contentSize.height - (scrollView.contentOffset.y + scrollView.height) < 0;
//    if (judgment1 || judgment2) {
//        return;
//    }
//
//    CGFloat CanMoveH = 70;
//    CGFloat scrollOffsetH = scrollView.contentOffset.y - _lastOffsetY;
//    // 突然滚动
//    if (ABS(scrollOffsetH) > CanMoveH) {
//        // 向上滚动
//        if (scrollOffsetH < -CanMoveH) {
//            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionScrollViewDidScroll:isDown:)]) {
//                [self.delegate collectionScrollViewDidScroll:scrollView isDown:YES];
//            }
//        }
//        // 向下滚动
//        else if (scrollOffsetH > CanMoveH) {
//            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionScrollViewDidScroll:isDown:)]) {
//                [self.delegate collectionScrollViewDidScroll:scrollView isDown:NO];
//            }
//        }
//        _lastOffsetY = scrollView.contentOffset.y;
//    }
//    // 慢慢滚动
//    else {
//        _lastOffsetY = scrollView.contentOffset.y;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            _lastOffsetY = scrollView.contentOffset.y;
//        });
//    }
}


@end






