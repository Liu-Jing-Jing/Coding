//
//  HomeControl.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeControl.h"
#import "HomeCell.h"

#pragma mark - 声明
@interface HomeControl()

@property (nonatomic, strong) HomeCell *cell;
// 圆弧
@property (nonatomic, strong) CAShapeLayer *arc;
//
@property (nonatomic, strong) CAShapeLayer *scalel;

@end

#pragma mark - 实现
@implementation HomeControl

#pragma mark - 初始化
- (void)initUI {
    [self setUserInteractionEnabled:NO];
    [self cell];
    [self arc];
    
    
    
}
- (HomeCell *)cell {
    if (!_cell) {
        _cell = [HomeCell loadCode:CGRectMake(0, self.height, ScreenWidth / 4, ScreenWidth / 4)];
        _cell.centerX = self.centerX;
        [self addSubview:_cell];
    }
    return _cell;
}
- (CAShapeLayer *)arc {
    if (!_arc) {
        _arc = [CAShapeLayer layer];
        _arc.frame = self.bounds;
        _arc.path = ({
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width / 2, self.height / 2) radius:self.width / 3 startAngle:0 endAngle:M_PI / 180 clockwise:YES];
            [path addLineToPoint:CGPointMake(self.width / 2, self.height / 2)];
            path.CGPath;
        });
        _arc.strokeStart = 0.1;
        _arc.strokeEnd = 0.2;
        _arc.lineWidth = 1.0f;
        _arc.masksToBounds = YES;
        _arc.fillColor = [UIColor clearColor].CGColor;
        _arc.strokeColor = [UIColor redColor].CGColor;
        [self.layer addSublayer:_arc];
    }
    return _arc;
}


#pragma mark - 设置
- (void)show:(CGFloat)alpha {
    // 显示
    if (alpha == 1) {
        [UIView animateWithDuration:.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _cell.top = 0;
        } completion:^(BOOL finished) {
            
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _arc.strokeStart = 0.01;
        });
    }
    // 隐藏
    else {
        
    }
}

@end
