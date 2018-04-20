//
//  UIView+Watch.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/20.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UIView+Watch.h"

@implementation UIView (Watch)

- (void)cornerClipRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

@end
