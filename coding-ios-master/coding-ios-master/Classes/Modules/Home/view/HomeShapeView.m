//
//  HomeShapeView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeShapeView.h"

typedef void (^HomeShapeViewBlock)();

#pragma mark - 声明
@interface HomeShapeView()

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) CAShapeLayer *bgshape;
@property (nonatomic, strong) CAShapeLayer *shape;
@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, copy  ) HomeShapeViewBlock block;

@end

#pragma mark - 实现
@implementation HomeShapeView

- (void)initUI {
    [self bgshape];
    [self shape];
}

- (CAShapeLayer *)bgshape {
    if (!_bgshape) {
        _bgshape = [CAShapeLayer layer];
        _bgshape.frame = [self bounds];
        _bgshape.path = ({
            CGFloat width = sqrt(pow(self.width / 2, 2) * 2);
            CGFloat height = width;
            CGFloat left = (self.width - width) / 2;
            CGFloat top = (self.height - height) / 2;
            CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left, top, width, height) cornerRadius:width / 2].CGPath;
            path;
        });
        _bgshape.fillColor = _bgColor.CGColor;
        [self.layer addSublayer:_bgshape];
    }
    return _bgshape;
}
- (CAShapeLayer *)shape {
    if (!_shape) {
        _shape = [CAShapeLayer layer];
        _shape.frame = [self bounds];
        _shape.fillColor = _shapeColor.CGColor;
        [self.layer addSublayer:_shape];
    }
    return _shape;
}
- (void)timer:(HomeShapeViewBlock)block {
    if (!_timer) {
        _block = block;
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(callback)];
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

#pragma mark - 设置
// 设置状态
- (void)setStatus:(HomeShapeStatus)status {
    _status = status;
    if (status == HomeShapeStatusNotDownload) {
        [self.timer invalidate];
        self.timer = nil;
        CGPathRef bgShapePath = [self rectWithProgress:sqrt(pow(self.width / 2, 2) * 2) * 1];
        [self.bgshape setPath:bgShapePath];
    }
    else if (status == HomeShapeStatusDownloading) {
        [self.timer invalidate];
        self.timer = nil;
        CGPathRef bgShapePath = [self rectWithProgress:sqrt(pow(self.width / 2, 2) * 2) * 1];
        [self.bgshape setPath:bgShapePath];
    }
    else if (status == HomeShapeStatusDownloaded) {
        [self.timer invalidate];
        self.timer = nil;
        [self timer:^{
            _progress -= 0.05;
            _progress = _progress <= 0 ? 0 : _progress;
            // 小于0 结束定时器
            if (_progress <= 0) {
                [self.timer invalidate];
                self.timer = nil;
                [self.shape setFillColor:[UIColor clearColor].CGColor];
                [self.bgshape setFillColor:[UIColor clearColor].CGColor];
            } else {
                [self.shape setFillColor:_shapeColor.CGColor];
                [self.bgshape setFillColor:_bgColor.CGColor];
            }
            // 线条
            CGPathRef shapePath = [self rectWithProgress:sqrt(pow(self.width / 2, 2) * 2) * _progress - countcoordinatesX(10)];
            CGPathRef bgShapePath = [self rectWithProgress:sqrt(pow(self.width / 2, 2) * 2) * _progress];
            [self.shape setPath:shapePath];
            [self.bgshape setPath:bgShapePath];
        }];
    }
}

#pragma mark - 动画
- (void)downloadProgress:(CGFloat)progress {
    _progress = progress;
    // 线条
    CGFloat width = sqrt(pow(self.width / 2, 2) * 2) * progress - countcoordinatesX(10);
    CGFloat height = width;
    CGFloat left = (self.width - width) / 2;
    CGFloat top = (self.height - height) / 2;
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left, top, width, height) cornerRadius:width / 2].CGPath;
    [self.shape setPath:path];
    [self.bgshape setFillColor:_bgColor.CGColor];
    [self.shape setFillColor:_shapeColor.CGColor];
}
- (void)downloadComplete {
    [self timer];
}

- (void)callback {
    if (_block) {
        _block();
    }
}
- (CGPathRef)rectWithProgress:(CGFloat)progress {
    CGFloat width = progress;
    CGFloat height = width;
    CGFloat left = (self.width - width) / 2;
    CGFloat top = (self.height - height) / 2;
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left, top, width, height) cornerRadius:width / 2].CGPath;
    return path;
}

@end
