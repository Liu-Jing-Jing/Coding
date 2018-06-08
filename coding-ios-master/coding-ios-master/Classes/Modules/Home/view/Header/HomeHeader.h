//
//  HomeHeader.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

@interface HomeHeader : BaseView

@property (nonatomic, strong) UIColor *bgColor;

- (void)changeHeight:(CGFloat)height duration:(NSTimeInterval)duration;

@end
