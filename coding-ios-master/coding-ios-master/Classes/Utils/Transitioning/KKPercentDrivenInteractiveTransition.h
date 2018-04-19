//
//  KKPercentDrivenInteractiveTransition.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)();

#pragma mark - typedef
typedef NS_ENUM(NSUInteger, KKInteractiveTransitionGestureDirection) {//手势的方向
    KKInteractiveTransitionGestureDirectionLeft = 0,
    KKInteractiveTransitionGestureDirectionRight,
    KKInteractiveTransitionGestureDirectionUp,
    KKInteractiveTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, KKInteractiveTransitionType) {//手势控制哪种转场
    KKInteractiveTransitionTypePresent = 0,
    KKInteractiveTransitionTypeDismiss,
    KKInteractiveTransitionTypePush,
    KKInteractiveTransitionTypePop,
};

#pragma mark - 声明
@interface KKPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition
/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;

//初始化方法

+ (instancetype)interactiveTransitionWithTransitionType:(KKInteractiveTransitionType)type GestureDirection:(KKInteractiveTransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(KKInteractiveTransitionType)type GestureDirection:(KKInteractiveTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end
