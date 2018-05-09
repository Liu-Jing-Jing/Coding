//
//  DetailContent.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailContent.h"

#pragma mark - 声明
@interface DetailContent ()

@end

#pragma mark - 实现
@implementation DetailContent

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    DetailContent *view = [DetailContent loadLastNib:frame];
    [view createView];
    return view;
}
- (void)createView {
    
}

@end
