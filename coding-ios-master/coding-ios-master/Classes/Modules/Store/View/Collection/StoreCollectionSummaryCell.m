//
//  StoreCollectionSummaryCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionSummaryCell.h"

#pragma mark - 声明
@interface StoreCollectionSummaryCell()

@property (weak, nonatomic) IBOutlet UIView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

#pragma mark - 实现
@implementation StoreCollectionSummaryCell

+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    StoreCollectionSummaryCell *cell = [StoreCollectionSummaryCell loadCode:collection index:indexPath];
    [cell createView];
    return cell;
}
- (void)createView {
    _name.font = [UIFont systemFontOfSize:adjustFont(12)];
    _name.textColor = ColorTextBold;
}

@end
