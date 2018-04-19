//
//  DiscoveryCollectionListCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryCollectionListCell.h"

#pragma mark - 声明
@interface DiscoveryCollectionListCell ()

@end

#pragma mark - 实现
@implementation DiscoveryCollectionListCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    DiscoveryCollectionListCell *cell = [DiscoveryCollectionListCell loadCode:collection index:index];
    [cell setBackgroundColor:BoldColor];
    return cell;
}

@end

