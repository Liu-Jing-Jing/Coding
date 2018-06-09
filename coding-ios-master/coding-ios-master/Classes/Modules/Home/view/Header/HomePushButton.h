//
//  HomePushButton.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "UIButton+HomeAnimation.h"
#import "BaseView+HomeHeader.h"

#pragma mark - 声明
@interface HomePushButton : BaseView

@property (nonatomic, assign) HomePushButtonTriangle type;

- (void)show;
- (void)hide;

@end

