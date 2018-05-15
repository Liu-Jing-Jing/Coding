//
//  ShelfListCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ShelfListCell.h"

#pragma mark - 声明
@interface ShelfListCell ()


@end

#pragma mark - 实现
@implementation ShelfListCell

+ (instancetype)initWithTable:(UITableView *)table {
    ShelfListCell *cell = [ShelfListCell loadLastNib:table];
    return cell;
}


@end
