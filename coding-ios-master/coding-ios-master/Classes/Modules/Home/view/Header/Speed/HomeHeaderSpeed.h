//
//  HomeHeaderSpeed.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - 代理
@class HomeHeaderSpeed;
@protocol HomeHeaderSpeedDelegate<NSObject>

@optional
/// 点击了关闭按钮
- (void)homeControl:(HomeHeaderSpeed *)view didTapClose:(UIButton *)close;

@end


#pragma mark - 声明
@interface HomeHeaderSpeed : BaseView

@property (nonatomic, weak  ) id<HomeHeaderSpeedDelegate> delegate;

- (void)show:(CGFloat)alpha;

@end
