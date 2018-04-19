//
//  ContentView.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

@interface ContentView : BaseView

@property (nonatomic, strong) UIImageView *icon;

+ (instancetype)init;
- (void)transitionDidAppear;
- (void)transitionDidDisappear;

@end
