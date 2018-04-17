//
//  HomeCollectionNewsCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionNewsCell.h"

#pragma mark - 声明
@interface HomeCollectionNewsCell()

@end

#pragma mark - 实现
@implementation HomeCollectionNewsCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionNewsCell *cell = [HomeCollectionNewsCell loadCode:collection index:index];
    cell.backgroundColor = MediumColor;
    return cell;
}

@end
