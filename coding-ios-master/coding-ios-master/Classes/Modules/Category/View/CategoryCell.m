//
//  CategoryCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "CategoryCell.h"

#pragma mark - 声明
@interface CategoryCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end

#pragma mark - 实现
@implementation CategoryCell

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [CategoryCell loadCode:collection index:indexPath];
    [cell createView];
    return cell;
}
- (void)createView {
    
}


@end
