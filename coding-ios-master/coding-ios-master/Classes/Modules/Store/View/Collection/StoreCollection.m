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

#pragma mark - 声明
@interface StoreCollection()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    // 之前滚动位置;
    CGFloat _lastOffsetY;
}
@property (nonatomic, strong) CarouselView *carouse;

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
    [self carouse];
    [self collection];
}
- (CarouselView *)carouse {
    if (!_carouse) {
        _carouse = [CarouselView initWithFrame:({
            CGFloat height = ScreenWidth / 5 * 2;
            CGRectMake(0, -height, ScreenWidth, height);
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
            UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
            flow;
        })];
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection setBackgroundColor:[UIColor whiteColor]];
        [_collection setContentInset:UIEdgeInsetsMake(self.carouse.height, 0, 0, 0)];
        [_collection setContentSize:CGSizeMake(0, ScreenHeight * 2)];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionSummaryCell" bundle:nil] forCellWithReuseIdentifier:@"StoreCollectionSummaryCell"];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionCategoryCell" bundle:nil] forCellWithReuseIdentifier:@"StoreCollectionCategoryCell"];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionDetailCell" bundle:nil] forCellWithReuseIdentifier:@"StoreCollectionDetailCell"];
        [_collection registerNib:[UINib nibWithNibName:@"StoreCollectionSectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"StoreCollectionSectionHeader"];
        [self addSubview:_collection];
    }
    return _collection;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    else if (section == 1) {
        return 2;
    }
    else if (section == 2) {
        return 1;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        StoreCollectionSummaryCell *cell = [StoreCollectionSummaryCell loadWithCollection:collectionView indexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 1) {
        StoreCollectionCategoryCell *cell = [StoreCollectionCategoryCell loadWithCollection:collectionView indexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 2) {
        StoreCollectionDetailCell *cell = [StoreCollectionDetailCell loadWithCollection:collectionView indexPath:indexPath];
        return cell;
    }
    return nil;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        StoreCollectionSectionHeader *header = [StoreCollectionSectionHeader initWithCollection:collectionView kind:kind indexPath:indexPath];
        return header;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CGFloat row = 3;
        CGFloat width = (ScreenWidth - countcoordinatesX(15) * (row + 1)) / row;
        return CGSizeMake(width, width / 3 * 4);
    }
    else if (indexPath.section == 1) {
        CGFloat row = 2;
        CGFloat width = (ScreenWidth - countcoordinatesX(15) * (row + 1)) / row;
        return CGSizeMake(width, width / 2);
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
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(0, countcoordinatesX(15), 0, countcoordinatesX(15));
    }
    else if (section == 1) {
        return UIEdgeInsetsMake(0, countcoordinatesX(15), 0, countcoordinatesX(15));
    }
    else if (section == 2) {
        return UIEdgeInsetsZero;
    }
    return UIEdgeInsetsZero;
}

#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    BOOL judgment1 = scrollView.contentOffset.y < 0;
    BOOL judgment2 = scrollView.contentSize.height - (scrollView.contentOffset.y + scrollView.height) < 0;
    if (judgment1 || judgment2) {
        return;
    }
    
    
    CGFloat scrollOffsetH = scrollView.contentOffset.y - _lastOffsetY;
    // 突然滚动
    if (ABS(scrollOffsetH) > 100) {
        // 向上滚动
        if (scrollOffsetH < -100) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionScrollViewDidScroll:isDown:)]) {
                [self.delegate collectionScrollViewDidScroll:scrollView isDown:YES];
            }
        }
        // 向下滚动
        else if (scrollOffsetH > 100) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionScrollViewDidScroll:isDown:)]) {
                [self.delegate collectionScrollViewDidScroll:scrollView isDown:NO];
            }
        }
        _lastOffsetY = scrollView.contentOffset.y;
    }
    // 慢慢滚动
    else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _lastOffsetY = scrollView.contentOffset.y;
        });
    }
}


@end






