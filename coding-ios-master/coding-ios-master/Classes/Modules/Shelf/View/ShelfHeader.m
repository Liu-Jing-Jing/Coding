//
//  ShelfHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ShelfHeader.h"

#pragma mark - 声明
@interface ShelfHeader()

@end

#pragma mark - 实现
@implementation ShelfHeader

+ (instancetype)initWithFrame:(CGRect)frame {
    ShelfHeader *header = [ShelfHeader loadCode:frame];
    header.backgroundColor = [UIColor redColor];
    return header;
}

@end
