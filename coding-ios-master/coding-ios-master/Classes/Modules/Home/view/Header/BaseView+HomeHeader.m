//
//  BaseView+HomeHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView+HomeHeader.h"

@implementation BaseView (HomeHeader)

// 创建三角形
- (CGMutablePathRef)createTriangleWithWidth:(CGFloat)width {
    // 三角边
    CGFloat triangleE = width;
    // 高度
    CGFloat triangleH = sqrt(pow(triangleE, 2) - pow(triangleE / 2, 2));
    // 顶部
    CGFloat top = [self createTopWithWidth:width];
    // 线条
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.width / 2, top);
    CGPathAddLineToPoint(path, NULL, self.width / 2 + triangleE / 2, top + triangleH);
    CGPathAddLineToPoint(path, NULL, self.width / 2 - triangleE / 2, top + triangleH);
    return path;
}
// 创建顶部
- (CGFloat)createTopWithWidth:(CGFloat)width {
    // 三角边
    CGFloat triangleE = [self createWidthWithWidth:width];
    // 高度
    CGFloat triangleH = [self createHeightWithWidth:triangleE];
    // 内切圆半径
    CGFloat circularR = sqrt(3) / 6.f * triangleE;
    // 顶部
    CGFloat top = self.height - (triangleH - circularR) - circularR - (self.height / 2 - circularR);
    return top;
}
// 创建宽度
- (CGFloat)createWidthWithWidth:(CGFloat)width {
    return width;
}
// 创建高度
- (CGFloat)createHeightWithWidth:(CGFloat)width {
    return sqrt(pow(width, 2) - pow(width / 2, 2));
}

@end
