//
//  StoreScroll.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "LRLChannelUnitModel.h"


#pragma mark - 代理
@protocol StoreScrollDelegate<NSObject>

@optional
// 正在滚动
- (void)contentScrollViewDidScroll:(UIScrollView *)scrollView;
// 滚动结束
- (void)contentScrollViewDidEndDecelerating:(UIScrollView *)scrollView;
// 向上/向下滚动
- (void)contentScrollViewDidScroll:(UIScrollView *)scroll isDown:(BOOL)isDown;

@end


#pragma mark - 声明
@interface StoreScroll : BaseView

// 代理
@property (nonatomic, weak  ) id<StoreScrollDelegate> delegate;
// 文本
@property (nonatomic, strong) NSArray<LRLChannelUnitModel *> *titles;
//
@property (nonatomic, strong) UIScrollView *pageScrollView;

/// 初始化
+ (instancetype)initWithFrame:(CGRect)frame;
/// 显示
- (void)show;
/// 隐藏
- (void)hide;

@end
