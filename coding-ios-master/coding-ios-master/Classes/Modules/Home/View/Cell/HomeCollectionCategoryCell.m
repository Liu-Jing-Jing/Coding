//
//  HomeCollectionCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionCategoryCell.h"

@implementation HomeCollectionCategoryCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionCategoryCell *cell = [HomeCollectionCategoryCell loadCode:collection index:index];
    cell.backgroundColor = MediumColor;
    return cell;
}

@end
