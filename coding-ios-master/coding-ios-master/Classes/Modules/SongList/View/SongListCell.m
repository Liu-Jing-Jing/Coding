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

@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIButton *menu;

@end

#pragma mark - 实现
@implementation SongListCell

#pragma mark - 初始化
+ (instancetype)initWithTable:(UITableView *)table {
    SongListCell *cell = [SongListCell loadLastNib:table];
    return cell;
}


@end
