//
//  StoreHeader.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - 代理
@protocol StoreHeaderDelegate<NSObject>

@optional
// 点击了page
- (void)headerSegmentedControl:(TLSegmentedControl *)segmentedControl didSelectIndex:(NSUInteger)index;

@end


#pragma mark - 声明
@interface StoreHeader : BaseView

// 代理
@property (nonatomic, weak  ) id<StoreHeaderDelegate> delegate;
// 文本
@property (nonatomic, strong) NSArray *titles;
// 导航栏
@property (nonatomic, strong) TLSegmentedControl *segmentBar;
// 搜索栏
@property (nonatomic, strong) UITextField *search;
// 分类
@property (nonatomic, strong) UIButton *seg;

/// 初始化
+ (instancetype)initWithFrame:(CGRect)frame;
/// 显示
- (void)show;
/// 隐藏
- (void)hide;

@end
