//
//  BaseView+HomeHeader.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#define HomeBgTriangleW self.width / 5 * 2
#define HomeTriangleW 50

#pragma mark - 声明
@interface BaseView (HomeHeader)

// 创建三角形
- (CGMutablePathRef)createTriangleWithWidth:(CGFloat)width;
// 创建顶部
- (CGFloat)createTopWithWidth:(CGFloat)width;
// 创建宽度
- (CGFloat)createWidthWithWidth:(CGFloat)width;
// 创建高度
- (CGFloat)createHeightWithWidth:(CGFloat)width;

@end
