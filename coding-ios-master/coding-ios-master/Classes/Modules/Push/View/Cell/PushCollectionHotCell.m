//
//  PushCollectionHotCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "PushCollectionHotCell.h"

#pragma mark - 声明
@interface PushCollectionHotCell()

@end

#pragma mark - 实现
@implementation PushCollectionHotCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    PushCollectionHotCell *cell = [PushCollectionHotCell loadCode:collection index:index];
    cell.backgroundColor = MediumColor;
    return cell;
}

@end
