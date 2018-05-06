//
//  ShelfView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/3.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ShelfView.h"
#import "ShelfHeader.h"

#pragma mark - 声明
@interface ShelfView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ShelfHeader *header;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray *images;

@end

#pragma mark - 实现
@implementation ShelfView

#pragma mark - 初始化
+ (instancetype)init {
    ShelfView *view = [[ShelfView alloc] initWithFrame:ScreenBounds];
    [view createView];
    return view;
}
- (void)createView {
    [self header];
    [self collection];
    [self bringSubviewToFront:self.header];
}
- (ShelfHeader *)header {
    if (!_header) {
        _header = [ShelfHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2)];
        [self addSubview:_header];
    }
    return _header;
}
- (UICollectionView *)collection {
    if (!_collection) {
        _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - TabbarHeight) collectionViewLayout:({
            CGFloat outPadding = countcoordinatesX(15);
            CGFloat inPadding = countcoordinatesX(10);
            NSInteger row = 3;
            CGFloat wdith = (ScreenWidth - outPadding * 2 - inPadding * (row - 1)) / 3;
            
            UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
            flow.itemSize = CGSizeMake(wdith, wdith / 4 * 5);
            flow.minimumLineSpacing = inPadding;
            flow.minimumInteritemSpacing = inPadding;
            flow;
        })];
        _collection.backgroundColor = ColorBg;
        _collection.contentInset = UIEdgeInsetsMake(self.header.height, countcoordinatesX(15), 0, countcoordinatesX(15));
        _collection.delegate = self;
        _collection.dataSource = self;
        [_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        [self addSubview:_collection];
        // 此处给其增加长按手势，用此手势触发cell移动效果
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelongGesture:)];
        [_collection addGestureRecognizer:longGesture];
    }
    return _collection;
}
- (NSMutableArray *)images {
    if (!_images) {
        _images = [[NSMutableArray alloc] init];
        for (int i=0; i<5; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%tu",i]];
        }
    }
    return _images;
}

#pragma mark - 手势操作
- (void)handlelongGesture:(UILongPressGestureRecognizer *)longGesture {
    //判断手势状态
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            // 判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [self.collection indexPathForItemAtPoint:[longGesture locationInView:self.collection]];
            if (indexPath == nil) {
                break;
            }
            // 在路径上则开始移动该路径上的cell
            [self.collection beginInteractiveMovementForItemAtIndexPath:indexPath];
            [UIView beginAnimations:nil context:nil];
            // 默认是1/4s，需要double类型数据
            [UIView setAnimationDuration:2.0];
            [self.collection updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collection]];
            // 提交动画，动画结束
            [UIView commitAnimations];
        }
            break;
        case UIGestureRecognizerStateChanged:
            // 移动过程当中随时更新cell位置
            [self.collection updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collection]];
            break;
        case UIGestureRecognizerStateEnded:
            // 移动结束后关闭cell移动
            [self.collection endInteractiveMovement];
            break;
        default:
            [self.collection cancelInteractiveMovement];
            break;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.text = self.images[indexPath.item];
    [label sizeToFit];
    cell.contentView.backgroundColor = [UIColor redColor];
    [cell.contentView addSubview:label];
    [cell.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell.contentView);
    }];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
// 是否允许其item移动
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    // 取出源item数据
    id objc = [self.images objectAtIndex:sourceIndexPath.item];
    // 从资源数组中移除该数据
    [self.images removeObject:objc];
    // 将数据插入到资源数组中的目标位置上
    [self.images insertObject:objc atIndex:destinationIndexPath.item];
}


@end
