//
//  StoreCollectionCategoryCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionCategoryCell.h"

#pragma mark - 声明
@interface StoreCollectionCategoryCell()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end

#pragma mark - 实现
@implementation StoreCollectionCategoryCell

+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    StoreCollectionCategoryCell *cell = [StoreCollectionCategoryCell loadCode:collection index:indexPath];
    [cell createView];
    return cell;
}
- (void)createView {
    _name.font = [UIFont boldSystemFontOfSize:adjustFont(16)];
    _name.textColor = ColorTextBold;
    _desc.font = [UIFont systemFontOfSize:adjustFont(12)];
    _desc.textColor = ColorTextMedium;
}

#pragma mark - 设置
- (void)setModel:(StoreSubModel *)model {
    _model = model;
    _name.text = model.name;
}

@end



