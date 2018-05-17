//
//  CategoryView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "CategoryView.h"
#import "CategoryCell.h"

#pragma mark - 声明
@interface CategoryView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) KKNavigationBar *bar;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UICollectionView *collection;

@end

#pragma mark - 实现
@implementation CategoryView

#pragma mark - 初始化
+ (instancetype)init {
    CategoryView *view = [CategoryView loadCode:ScreenBounds];
    [view createView];
    return view;
}
- (void)createView {
    [self setBackgroundColor:[UIColor whiteColor]];
    [self header];
    [self collection];
    [self bar];
}
- (KKNavigationBar *)bar {
    if (!_bar) {
        _bar = [KKNavigationBar init];
        _bar.backgroundColor = [UIColor blueColor];
        [self addSubview:_bar];
    }
    return _bar;
}
- (UIView *)header {
    if (!_header) {
        _header = [[UIView alloc] initWithFrame:CGRectMake(0, -ScreenWidth / 3, ScreenWidth, ScreenWidth / 3)];
        _header.backgroundColor = [UIColor orangeColor];
        [self.collection addSubview:_header];
    }
    return _header;
}
- (UICollectionView *)collection {
    if (!_collection) {
        CGFloat padding = countcoordinatesX(10);
        
        _collection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:({
            UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
            flow.itemSize = ({
                CGFloat width = (ScreenWidth - padding) / 2;
                CGSizeMake(width, width + 40);
            });
            flow.minimumLineSpacing = padding;
            flow;
        })];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.contentInset = UIEdgeInsetsMake(_header.height, 0, padding, 0);
        _collection.mj_footer = [MJRefreshBackNormalFooter footerWithNormalRefreshingSEL:self refreshingAction:@selector(footerRefresh)];
        [_collection registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil] forCellWithReuseIdentifier:@"CategoryCell"];
        [self addSubview:_collection];
    }
    return _collection;
}

#pragma mark - 刷新
- (void)footerRefresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_collection.mj_footer endRefreshing];
    });
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 22;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [CategoryCell initWithCollection:collectionView indexPath:indexPath];
    return cell;
}


@end





