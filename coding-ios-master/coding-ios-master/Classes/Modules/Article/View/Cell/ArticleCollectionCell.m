//
//  ArticleCollectionCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleCollectionCell.h"

#pragma mark - 声明
@interface ArticleCollectionCell()

@end

#pragma mark - 实现
@implementation ArticleCollectionCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    ArticleCollectionCell *cell = [ArticleCollectionCell loadCode:collection index:index];
    cell.backgroundColor = MediumColor;
    return cell;
}

@end
