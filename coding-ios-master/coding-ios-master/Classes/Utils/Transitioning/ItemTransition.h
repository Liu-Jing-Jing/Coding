//
//  ItemTransitioning.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - typeof
typedef NS_ENUM(NSUInteger, ItemTransitionType) {
    ItemTransitionTypePresent = 0,  // 管理present动画
    ItemTransitionTypeDismiss       // 管理dismiss动画
};

#pragma mark - 声明
@interface ItemTransition : NSObject<UIViewControllerAnimatedTransitioning>

//根据定义的枚举初始化的两个方法
+ (instancetype)transitionWithTransitionType:(ItemTransitionType)type;
- (instancetype)initWithTransitionType:(ItemTransitionType)type;

@end
