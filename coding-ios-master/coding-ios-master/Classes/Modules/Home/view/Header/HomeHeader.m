//
//  HomeHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeader.h"
#import "DisplayLinkUtil.h"
#import "HomeDraw.h"
#import "HomeCircle.h"

#pragma mark - 声明
@interface HomeHeader() {
    CGFloat _shapeH;
}

@property (nonatomic, strong) HomeDraw *draw;
@property (nonatomic, strong) HomeCircle *circle;
@property (nonatomic, strong) DisplayLinkUtil *link;
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *shape;
@property (nonatomic, strong) NSMutableArray<NSArray<NSNumber *> *> *controls;

@end

#pragma mark - 实现
@implementation HomeHeader

#pragma mark - 初始化
- (void)initUI {
    _shapeH = self.height;
    [self shape];
    [self link];
    [self draw];
    [self circle];
    [self setBackgroundColor:[UIColor whiteColor]];
}
- (NSMutableArray<CAShapeLayer *> *)shape {
    if (!_shape) {
        _shape = [[NSMutableArray alloc] init];
        for (int i=0; i<10; i++) {
            CAShapeLayer *shape = [CAShapeLayer layer];
            shape.frame = [self bounds];
            shape.fillColor = [[UIColor grayColor] colorWithAlphaComponent:0.1].CGColor;
            [self.layer addSublayer:shape];
            [_shape addObject:shape];
        }
    }
    return _shape;
}
- (NSMutableArray<NSArray<NSNumber *> *> *)controls {
    if (!_controls) {
        _controls = [[NSMutableArray alloc] init];
        for (int i=0; i<self.shape.count; i++) {
            if (i == 0) {
                [_controls addObject:@[@(_shapeH - 20),@(ScreenWidth / 2),@(_shapeH),@(_shapeH - 20)]];
            }
            else if (i == 1) {
                [_controls addObject:@[@(_shapeH - 20),@(ScreenWidth / 2),@(_shapeH - 10),@(_shapeH - 30)]];
            }
            else if (i == 2) {
                [_controls addObject:@[@(_shapeH - 30),@(ScreenWidth / 2),@(_shapeH - 20),@(_shapeH - 20)]];
            }
            else if (i == 3) {
                [_controls addObject:@[@(_shapeH - 30),@(ScreenWidth / 2),@(_shapeH - 30),@(_shapeH - 35)]];
            }
            else if (i == 4) {
                [_controls addObject:@[@(_shapeH - 50),@(ScreenWidth / 2),@(_shapeH - 35),@(_shapeH - 40)]];
            }
            else if (i == 5) {
                [_controls addObject:@[@(_shapeH - 50),@(ScreenWidth / 2),@(_shapeH - 35),@(_shapeH - 50)]];
            }
            else if (i == 6) {
                [_controls addObject:@[@(_shapeH - 55),@(ScreenWidth / 2),@(_shapeH - 45),@(_shapeH - 65)]];
            }
            else if (i == 7) {
                [_controls addObject:@[@(_shapeH - 65),@(ScreenWidth / 2),@(_shapeH - 45),@(_shapeH - 55)]];
            }
            else if (i == 8) {
                [_controls addObject:@[@(_shapeH - 85),@(ScreenWidth / 2 + 20),@(_shapeH - 55),@(_shapeH - 75)]];
            }
            else if (i == 9) {
                [_controls addObject:@[@(_shapeH - 75),@(ScreenWidth / 2 + 20),@(_shapeH - 55),@(_shapeH - 85)]];
            }
        }
    }
    return _controls;
}
- (HomeDraw *)draw {
    if (!_draw) {
        _draw = [HomeDraw loadCode:CGRectMake(0, 0, ScreenWidth, self.height)];
        [self addSubview:_draw];
    }
    return _draw;
}
- (HomeCircle *)circle {
    if (!_circle) {
        _circle = [HomeCircle loadCode:CGRectMake(0, 0, ScreenWidth, self.height)];
        _circle.userInteractionEnabled = NO;
        [self addSubview:_circle];
    }
    return _circle;
}



- (void)changeHeight:(CGFloat)height duration:(NSTimeInterval)duration {
//    [self setControls:nil];
//    [UIView animateWithDuration:duration animations:^{
//        [self setHeight:height];
//    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _bgColor = [UIColor colorWithRed:random() % 255 / 255.f green:random() % 255 / 255.f blue:random() % 255 / 255.f alpha:1];
}


- (DisplayLinkUtil *)link {
    if (!_link) {
        CFTimeInterval beginTime = CACurrentMediaTime();
        _link = [DisplayLinkUtil initWithBlock:^{
//            CGFloat fromH = ScreenWidth;
//            CGFloat toH = self.height / 750.f * 1030;
//            NSTimeInterval duration = 0.3f;
//            NSTimeInterval currentTime = CACurrentMediaTime() - beginTime;
//            
//            CGFloat percent = currentTime / duration;
//            if (percent > 1) {
//                percent = 1;
////                [displayLink invalidate];
//            }
//            
//            percent = [self easeIn:percent];
//            NSLog(@"%.2f",percent);
//            
//            CGFloat h = [self _interpolateFrom:fromH to:toH percent:percent];
//            _shapeH = h;
//            [self setControls:nil];
            
            
//            if (_shapeH < self.height) {
//                [self setControls:nil];
//                _shapeH += 5;
//                if (_shapeH > self.height) {
//                    _shapeH = self.height;
//                }
//            }
//            else if (_shapeH > self.height) {
//                [self setControls:nil];
//                _shapeH -= 5;
//                if (_shapeH < self.height) {
//                    _shapeH = self.height;
//                }
//            }
//
            for (int i=0; i<_shape.count; i++) {
                CAShapeLayer *layer = _shape[i];
                layer.fillColor = [_bgColor colorWithAlphaComponent:0.1].CGColor;
                NSArray *numbers = self.controls[i];

                CGMutablePathRef path = CGPathCreateMutable();
                CGPathMoveToPoint(path, NULL, 0, 0);
                CGPathAddLineToPoint(path, NULL, ScreenWidth, 0);
                CGPathAddLineToPoint(path, NULL, ScreenWidth, [numbers[3] floatValue]);
                CGPathAddQuadCurveToPoint(path, nil, [numbers[1] floatValue], [numbers[2] floatValue], 0, [numbers[0] floatValue]);
                layer.path = path;
            }
        }];
    }
    return _link;
}


//- (void)changeHeight:(CGFloat)height duration:(NSTimeInterval)duration {
//    CGPoint fromPoint = CGPointMake(10, 20);
//    CGPoint toPoint = CGPointMake(300, 400);
//    NSTimeInterval duration = 2.78;
//    NSTimeInterval currentTime = CACurrentMediaTime() - self.beginTime;
//
//    CGFloat percent = currentTime / duration;
//    if (percent > 1) {
//        percent = 1;
//        [displayLink invalidate];
//    }
//
//    percent = [self easeIn:percent];
//
//    CGFloat x = [self _interpolateFrom:fromPoint.x to:toPoint.x percent:percent];
//    CGFloat y = [self _interpolateFrom:fromPoint.y to:toPoint.y percent:percent];
//}

- (CGFloat)_interpolateFrom:(CGFloat)from to:(CGFloat)to percent:(CGFloat)percent
{
    return from + (to - from) * percent;
}
- (CGFloat)easeIn:(CGFloat)p
{
    return p * p;
}





@end
