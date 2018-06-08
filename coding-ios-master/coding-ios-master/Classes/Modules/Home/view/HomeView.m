//
//  HomeView.m
//  coding-ios-master
//
//  Created by MAC on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeView.h"
#import "HomeHeader.h"
#import "HomeCell.h"
#import "HomeBar.h"

#pragma mark - 声明
@interface HomeView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) HomeBar *bar;
@property (nonatomic, strong) HomeHeader *header;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) NSArray *data;

@end

#pragma mark - 实现
@implementation HomeView

#pragma mark - 初始化
- (void)initUI {
    [self header];
    [self collection];
    [self bar];
    [self bringSubviewToFront:_header];
    [self bringSubviewToFront:_bar];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        CGFloat headerH = self.header.height / 750.f * 1030;
//        CGFloat moveH = _collection.contentOffset.y - (headerH - _header.height);
//        [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//            [_collection setContentInset:UIEdgeInsetsMake(headerH, 0, 0, 0)];
//            [_collection setContentOffset:CGPointMake(0, moveH) animated:NO];
//        } completion:^(BOOL finished) {
//            
//        }];
//        [_header changeHeight:headerH duration:0.5f];
//    });
}
- (HomeBar *)bar {
    if (!_bar) {
        _bar = [HomeBar loadCode:CGRectMake(0, 0, ScreenWidth, NavigationBarHeight)];
        [self addSubview:_bar];
    }
    return _bar;
}
- (HomeHeader *)header {
    if (!_header) {
        _header = [HomeHeader loadCode:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
        _header.bgColor = [UIColor grayColor];
        [self addSubview:_header];
    }
    return _header;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:ScreenBounds collectionViewLayout:({
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout;
        })];
        [_collection setShowsVerticalScrollIndicator:NO];
        [_collection setContentInset:UIEdgeInsetsMake(self.header.height, 0, 0, 0)];
        [_collection setBackgroundColor:[UIColor whiteColor]];
        [_collection setDelegate:self];
        [_collection setDataSource:self];
        [_collection registerClass:[HomeCell class] forCellWithReuseIdentifier:@"HomeCell"];
        [self addSubview:_collection];
    }
    return _collection;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 109;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [HomeCell loadCode:collectionView index:indexPath];
    cell.shapeColor = [UIColor orangeColor];
    if (indexPath.row == 100) {
        cell.progress = 0.9;
        cell.status = HomeShapeStatusDownloading;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cell.status = HomeShapeStatusDownloaded;
        });
    }
    else if (indexPath.row == 101) {
        cell.status = HomeShapeStatusDownloaded;
    }
    else {
        cell.status = HomeShapeStatusNotDownload;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = (HomeCell *)[_collection cellForItemAtIndexPath:indexPath];
    cell.progress = 0;
    cell.status = HomeShapeStatusDownloading;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cell.status = HomeShapeStatusDownloaded;
    });
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth / 4, ScreenWidth / 4);
}

@end

