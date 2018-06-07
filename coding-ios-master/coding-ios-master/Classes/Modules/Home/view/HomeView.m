//
//  HomeView.m
//  coding-ios-master
//
//  Created by MAC on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeView.h"
#import "HomeCell.h"

#pragma mark - 声明
@interface HomeView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation HomeView

#pragma mark - 初始化
- (void)initUI {
    [self collection];
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:ScreenBounds collectionViewLayout:({
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            layout;
        })];
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
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [HomeCell loadCode:collectionView index:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth / 4, ScreenWidth / 4);
}

@end
