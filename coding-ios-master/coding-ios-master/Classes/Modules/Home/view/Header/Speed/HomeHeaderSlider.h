//
//  HomeHeaderSlider.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - 代理
@class HomeHeaderSlider;
@protocol HomeHeaderSliderDelegate<NSObject>

@optional
// 值改变了
- (void)headerSlider:(HomeHeaderSlider *)slider valueDidChange:(CGFloat)percentage;

@end

#pragma mark - 声明
@interface HomeHeaderSlider : BaseView

//
@property (nonatomic, weak  ) id<HomeHeaderSliderDelegate> delegate;

- (void)show:(CGFloat)alpha;

@end
