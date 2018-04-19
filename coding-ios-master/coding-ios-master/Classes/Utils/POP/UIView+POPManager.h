//
//  UIView+POPManager.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (POPManager)

- (void)pop_addSpringAnimation:(NSString *)key to:(NSNumber *)to;
- (void)pop_addSpringAnimation:(NSString *)key to:(NSNumber *)to from:(NSNumber *)from;
- (void)pop_addSpringAnimation:(NSString *)key to:(NSNumber *)to from:(NSNumber *)from time:(NSTimeInterval)time ;

@end
