//
//  UIView+POPManager.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UIView+POPManager.h"

@implementation UIView (POPManager)

- (void)pop_addSpringAnimation:(NSString *)key to:(NSNumber *)to {
    [self pop_addSpringAnimation:key to:to from:nil];
}
- (void)pop_addSpringAnimation:(NSString *)key to:(NSNumber *)to from:(NSNumber *)from {
    [self pop_addSpringAnimation:key to:to from:from time:1];
}
- (void)pop_addSpringAnimation:(NSString *)key to:(NSNumber *)to from:(NSNumber *)from time:(NSTimeInterval)time {
    POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    if (from) {
        anSpring.fromValue = from;
    }
    if (to) {
        anSpring.toValue = to;
    }
    if (!time) {
        time = 1;
    }
    anSpring.beginTime = CACurrentMediaTime() + time;
    anSpring.springBounciness = 10.0f;
    [self pop_addAnimation:anSpring forKey:key];
}

@end
