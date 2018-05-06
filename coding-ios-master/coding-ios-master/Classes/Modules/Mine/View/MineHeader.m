//
//  MineHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/6.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineHeader.h"

#pragma mark - 声明
@interface MineHeader()

@end

#pragma mark - 实现
@implementation MineHeader

+ (instancetype)initWithFrame:(CGRect)frame {
    MineHeader *header = [MineHeader loadFirstNib:frame];
    return header;
}

@end
