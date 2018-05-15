//
//  SongListCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SongListCell.h"

#pragma mark - 声明
@interface SongListCell ()

@end

#pragma mark - 实现
@implementation SongListCell

+ (instancetype)initWithTable:(UITableView *)table {
    SongListCell *cell = [SongListCell loadLastNib:table];
    return cell;
}


@end
