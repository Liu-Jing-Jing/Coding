//
//  HomeDraw.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeDraw.h"
#import "BaseView+HomeHeader.h"
#import "DisplayLinkUtil.h"
#import "HomePushButton.h"

#pragma mark - 声明
@interface HomeDraw()<UIGestureRecognizerDelegate> {
    CGFloat aaa;
}

/// 背景三角形
@property (nonatomic, strong) CAShapeLayer *bgTriangle;
/// 移动三角形
@property (nonatomic, strong) CAShapeLayer *moveTriangle;
/// 内置三角形
@property (nonatomic, strong) CAShapeLayer *triangle;
/// 按钮
@property (nonatomic, strong) NSMutableArray<UIImageView *> *chooses;
/// 弹出视图
@property (nonatomic, strong) NSMutableArray<HomePushButton *> *pushs;

@end

#pragma mark - 实现
@implementation HomeDraw

#pragma mark - 初始化
- (void)initUI {
    [self bgTriangle];
    [self moveTriangle];
    [self triangle];
    [self chooses];
    [self pushs];
    
    [DisplayLinkUtil initWithBlock:^{
        aaa += 0.005;
        if (aaa >= 1) {
            aaa = 0;
        }
        _moveTriangle.path = [self createTriangleWithPercent1:aaa / 2 percent2:aaa / 3 percent3:aaa];
    }];
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
- (CAShapeLayer *)moveTriangle {
    if (!_moveTriangle) {
        _moveTriangle = [CAShapeLayer layer];
        _moveTriangle.frame = [self bounds];
        _moveTriangle.path = [self createTriangleWithPercent1:0.2 percent2:0.9 percent3:0.1];
        _moveTriangle.fillColor = [[UIColor greenColor] colorWithAlphaComponent:0.5].CGColor;
        [self.layer addSublayer:_moveTriangle];
    }
    return _moveTriangle;
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
- (NSMutableArray<UIImageView *> *)chooses {
    if (!_chooses) {
        _chooses = [[NSMutableArray alloc] init];
        CGFloat padding = 10;
        NSArray *rects = @[NSStringFromCGRect(CGRectMake(self.centerX - 30 / 2, [self createTopWithWidth:HomeBgTriangleW] - 30 - padding, 30, 30)),
                           NSStringFromCGRect(({
                               CGFloat triangle = HomeBgTriangleW;
                               CGFloat width = 30;
                               CGFloat height = width;
                               CGFloat left = (self.width - triangle) / 2 - width - padding;
                               CGFloat top = [self createTopWithWidth:triangle] + [self createHeightWithWidth:triangle] + padding;
                               CGRectMake(left, top, width, height);
                           })),
                           NSStringFromCGRect(({
                               CGFloat triangle = HomeBgTriangleW;
                               CGFloat width = 30;
                               CGFloat height = width;
                               CGFloat left = (self.width - triangle) / 2 + triangle + padding;
                               CGFloat top = [self createTopWithWidth:triangle] + [self createHeightWithWidth:triangle] + padding;
                               CGRectMake(left, top, width, height);
                           }))];
        for (int i=0; i<rects.count; i++) {
            UIImageView *choose = [[UIImageView alloc] init];
            [choose setFrame:CGRectFromString(rects[i])];
            [choose setBackgroundColor:[UIColor redColor]];
            [choose setUserInteractionEnabled:YES];
            [choose setTag:i];
            [self addSubview:choose];
            [_chooses addObject:choose];
        }
    }
    return _chooses;
}
- (NSMutableArray<HomePushButton *> *)pushs {
    if (!_pushs) {
        _pushs = [[NSMutableArray alloc] init];
        for (int i=0; i<3; i++) {
            HomePushButton *button = [HomePushButton loadCode:self.chooses[i].frame];
            [button setType:i];
            [self addSubview:button];
            [_pushs addObject:button];
        }
    }
    return _pushs;
}

- (UILongPressGestureRecognizer *)createLongGesture:(id)target action:(SEL)selection {
    UILongPressGestureRecognizer *longG = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selection];
    return longG;
}


#pragma mark - 点击
- (void)chooseTapClick:(UIGestureRecognizer *)gestrue {
    NSLog(@"1231232");
}
- (void)chooseLongClick:(UIGestureRecognizer *)gestrue {
    if (gestrue.state == UIGestureRecognizerStateBegan) {
        [self.pushs[gestrue.view.tag] show];
        
    }
    else if (gestrue.state == UIGestureRecognizerStateChanged) {
        NSLog(@"123");
    }
    else if (gestrue.state == UIGestureRecognizerStateEnded) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.pushs[gestrue.view.tag] hide];
        });
    }
}




@end




