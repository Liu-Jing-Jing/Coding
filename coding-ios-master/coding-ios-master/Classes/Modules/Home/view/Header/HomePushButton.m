//
//  HomePushButton.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomePushButton.h"

#pragma mark - 声明
@interface HomePushButton()

// 是否在动画中
@property (nonatomic, assign, getter=isShow) BOOL show;
@property (nonatomic, strong) UIButton *push1;
@property (nonatomic, strong) UIButton *push2;

@end

#pragma mark - 实现
@implementation HomePushButton

#pragma mark - 初始化
- (void)initUI {
    [self push1];
    [self push2];
    [self setUserInteractionEnabled:YES];
    [self chooseTapClick];
    [self createLongGesture:self action:@selector(chooseLongClick:)];
}
- (UIButton *)push1 {
    if (!_push1) {
        _push1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _push1.frame = CGRectMake(0, 0, 30, 30);
        _push1.backgroundColor = [UIColor greenColor];
        _push1.layer.cornerRadius = 30 / 2;
        _push1.layer.masksToBounds = YES;
        _push1.alpha = 0;
        [_push1 addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [self enlarge];
        }];
        [self addSubview:_push1];
    }
    return _push1;
}
- (UIButton *)push2 {
    if (!_push2) {
        _push2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _push2.frame = CGRectMake(0, 0, 30, 30);
        _push2.backgroundColor = [UIColor blueColor];
        _push2.layer.cornerRadius = 30 / 2;
        _push2.layer.masksToBounds = YES;
        _push2.alpha = 0;
        [_push2 addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [self narrow];
        }];
        [self addSubview:_push2];
    }
    return _push2;
}
- (void)createLongGesture:(id)target action:(SEL)selection {
    UILongPressGestureRecognizer *longG = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selection];
    [self addGestureRecognizer:longG];
}

#pragma mark - 手势
// 点击
- (void)chooseTapClick {
//    __weak typeof(self) weak = self;
    [self addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        NSLog(@"asdadtao");
    }];
}
// 长按
- (void)chooseLongClick:(UIGestureRecognizer *)gestrue {
    if (gestrue.state == UIGestureRecognizerStateBegan) {
        [self show];
    }
    else if (gestrue.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [gestrue locationInView:self];
        if (CGRectContainsPoint(_push1.frame, point)) {
            NSLog(@"在push1里");
            [self enlarge];
        }
        else if (CGRectContainsPoint(_push2.frame, point)) {
            NSLog(@"在push2里");
            [self narrow];
        }
    }
    else if (gestrue.state == UIGestureRecognizerStateEnded) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hide];
        });
    }
}

#pragma mark - 事件响应
// 更改响应范围
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self.subviews) {
        BOOL isTouch = CGRectContainsPoint(view.frame, point);
        if (isTouch == YES) {
            return view;
        }
    }
    return [super hitTest:point withEvent:event];
}

#pragma mark - 动画
- (void)show {
    if (_show == YES) {
        return;
    }
    _show = YES;
    
    
    [_push1 addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationShow position:_type button:HomePushBtnOne];
    [_push2 addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationShow position:_type button:HomePushBtnTwo];
    
    [_push1 addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationShow];
    [_push2 addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationShow];
    
    [_push1 addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationShow];
    [_push2 addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationShow];
    
}
- (void)hide {
    if (_show == NO) {
        return;
    }
    _show = NO;
    
    
    __weak typeof(self) weak = self;
    [_push2 addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:CGPointMake(1.3, 1.3)];
    [_push1 addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:CGPointMake(1.3, 1.3) complete:^(POPAnimation *anim, BOOL finished) {
        [weak.push1 addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationHide position:weak.type button:HomePushBtnOne];
        [weak.push2 addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationHide position:weak.type button:HomePushBtnTwo];
        
        [weak.push1 addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationHide];
        [weak.push2 addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationHide];
        
        [weak.push1 addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:CGPointMake(0.1, 0.1)];
        [weak.push2 addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:CGPointMake(0.1, 0.1)];
    }];
    
    
}

// 放大
- (void)enlarge {
    [_push1 createScale:CGPointMake(1.1, 1.1) name:kCAMediaTimingFunctionEaseInEaseOut duration:0.2];
}
// 缩小
- (void)narrow {
    [_push1 createScale:CGPointMake(1, 1) name:kCAMediaTimingFunctionEaseInEaseOut duration:0.2];
}


@end






