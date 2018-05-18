//
//  SearchCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SearchCell.h"

#pragma mark - 声明
@interface SearchCell ()

@end

#pragma mark - 实现
@implementation SearchCell

#pragma mark - 初始化
+ (instancetype)initWithTable:(UITableView *)table index:(NSIndexPath *)index {
    SearchCell *cell = [SearchCell loadLastNib:table];
    return cell;
}


@end
