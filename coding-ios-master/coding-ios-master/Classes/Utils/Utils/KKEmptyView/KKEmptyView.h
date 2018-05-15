//
//  KKEmptyView.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/20.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - typedef
// 空界面类型枚举
typedef enum : NSUInteger {
    EmptyViewTypeCommon,    // 通用空界面
    EmptyViewTypeFail,      // 页面加载失败
    EmptyViewTypeNetFail,   // 网络请求失败
    EmptyViewTypeSystemBusy,  // 抱歉！系统繁忙
    EmptyViewTypeCart,      // 暂无商品
    EmptyViewTypeLoading    // 加载中……
} EmptyViewType;

// 空界面里面事件类型
typedef enum : NSUInteger {
    EmptyViewEventTypeBuy,      // 无商品
    EmptyViewEventTypeReload    // 重新加载
} EmptyViewEventType;

// 页面的展示样式(文字 / 文字+图片 / 文字+图片+按钮)
typedef enum : NSUInteger {
    EmptyViewLayoutTypeTitle,           // 文字
    EmptyViewLayoutTypeTitleIcon,       // 文字+图片
    EmptyViewLayoutTypeTitleIconButton, // 文字+图片+按钮
} EmptyViewLayoutType;

typedef void (^EmptyViewEventBlock)(EmptyViewEventType eventType);

#pragma mark - 声明
@interface KKEmptyView : UIView

/// 初始化空视图
- (instancetype)initEmptyViewType:(EmptyViewType)emptyViewType showInView:(UIView *)view eventBlock:(EmptyViewEventBlock)eventBlock;
/// 初始化空视图(拓展全屏的情况)
- (instancetype)initEmptyViewType:(EmptyViewType)emptyViewType showInView:(UIView *)view backButton:(BOOL)backButton eventBlock:(EmptyViewEventBlock)eventBlock;
/// 显示
- (void)show;
/// 隐藏
- (void)hide;

@end
