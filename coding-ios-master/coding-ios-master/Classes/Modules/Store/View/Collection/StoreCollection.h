//
//  StoreCollection.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - 代理
@protocol StoreCollectionDelegate<NSObject>

@optional
- (void)collectionScrollViewDidScroll:(UIScrollView *)scroll isDown:(BOOL)isDown;

@end


#pragma mark - 声明
@interface StoreCollection : BaseView

@property (nonatomic, weak  ) id<StoreCollectionDelegate> delegate;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, assign) NSInteger lid;

/// 初始化
+ (instancetype)initWithFrame:(CGRect)frame;
/// 开始下拉请求
- (void)beginHeaderRefresh;

@end
