//
//  StoreCollectionSectionHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionSectionHeader.h"

#pragma mark - 声明
@interface StoreCollectionSectionHeader()

@end

#pragma mark - 实现
@implementation StoreCollectionSectionHeader

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    StoreCollectionSectionHeader *header = [super initWithCollection:collection kind:UICollectionElementKindSectionHeader indexPath:indexPath];
    [header createLayout];
    return header;
}
- (void)createLayout {
    _name.textColor = ColorTextBold;
    _name.font = [UIFont systemFontOfSize:adjustFont(12)];
    
}

#pragma mark - 动画
- (void)show {
    
}
- (void)hide {
    
}


@end
