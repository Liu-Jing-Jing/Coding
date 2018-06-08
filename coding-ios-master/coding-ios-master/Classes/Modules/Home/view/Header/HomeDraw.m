//
//  HomeDraw.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeDraw.h"
#import "BaseView+HomeHeader.h"

#pragma mark - 声明
@interface HomeDraw()

/// 背景三角形
@property (nonatomic, strong) CAShapeLayer *bgTriangle;
/// 内置三角形
@property (nonatomic, strong) CAShapeLayer *triangle;
/// 三个按钮
@property (nonatomic, strong) UIButton *choose1;
@property (nonatomic, strong) UIButton *choose2;
@property (nonatomic, strong) UIButton *choose3;

@end

#pragma mark - 实现
@implementation HomeDraw

#pragma mark - 初始化
- (void)initUI {
    
    [self bgTriangle];
    [self triangle];
    [self choose1];
    [self choose2];
    [self choose3];
}
- (CAShapeLayer *)bgTriangle {
    if (!_bgTriangle) {
        _bgTriangle = [CAShapeLayer layer];
        _bgTriangle.frame = [self bounds];
        _bgTriangle.path = [self createTriangleWithWidth:HomeBgTriangleW];
        _bgTriangle.fillColor = [UIColor redColor].CGColor;
        [self.layer addSublayer:_bgTriangle];
    }
    return _bgTriangle;
}
- (CAShapeLayer *)triangle {
    if (!_triangle) {
        _triangle = [CAShapeLayer layer];
        _triangle.frame = [self bounds];
        _triangle.path = [self createTriangleWithWidth:HomeTriangleW];
        _triangle.fillColor = [UIColor orangeColor].CGColor;
        [self.layer addSublayer:_triangle];
    }
    return _triangle;
}
- (UIButton *)choose1 {
    if (!_choose1) {
        _choose1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _choose1.frame = CGRectMake(0, [self createTopWithWidth:HomeBgTriangleW] - 30, 30, 30);
        _choose1.centerX = self.centerX;
        _choose1.backgroundColor = [UIColor redColor];
        [self addSubview:_choose1];
    }
    return _choose1;
}
- (UIButton *)choose2 {
    if (!_choose2) {
        _choose2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _choose2.frame = ({
            CGFloat triangle = HomeBgTriangleW;
            
            CGFloat width = 30;
            CGFloat height = width;
            CGFloat left = (self.width - triangle) / 2 - width;
            CGFloat top = [self createTopWithWidth:triangle] + [self createHeightWithWidth:triangle];
            CGRectMake(left, top, width, height);
        });
        _choose2.backgroundColor = [UIColor redColor];
        [self addSubview:_choose2];
    }
    return _choose2;
}
- (UIButton *)choose3 {
    if (!_choose3) {
        _choose3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _choose3.frame = ({
            CGFloat triangle = HomeBgTriangleW;
            
            CGFloat width = 30;
            CGFloat height = width;
            CGFloat left = (self.width - triangle) / 2 + triangle;
            CGFloat top = [self createTopWithWidth:triangle] + [self createHeightWithWidth:triangle];
            CGRectMake(left, top, width, height);
        });
        _choose3.backgroundColor = [UIColor redColor];
        [self addSubview:_choose3];
    }
    return _choose3;
}




@end




