//
//  StoreCollectionDetailCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionDetailCell.h"

#pragma mark - 声明
@interface StoreCollectionDetailCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraintT;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tagConstraintR;

@end

#pragma mark - 实现
@implementation StoreCollectionDetailCell

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    StoreCollectionDetailCell *cell = [StoreCollectionDetailCell loadWithCollection:collection indexPath:indexPath];
    [cell createLayout];
    return cell;
}
- (void)createLayout {
    _iconConstraintL.constant = countcoordinatesX(15);
    _iconConstraintT.constant = countcoordinatesX(10);
    _nameConstraintL.constant = countcoordinatesX(10);
    _tagConstraintR.constant  = countcoordinatesX(15);
}

@end
