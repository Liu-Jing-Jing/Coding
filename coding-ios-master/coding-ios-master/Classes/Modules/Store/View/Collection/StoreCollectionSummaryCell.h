//
//  StoreCollectionSummaryCell.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseCollectionCell.h"
#import "StoreModel.h"

@interface StoreCollectionSummaryCell : BaseCollectionCell

@property (nonatomic, strong) StoreSubModel *model;

+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath;

@end
