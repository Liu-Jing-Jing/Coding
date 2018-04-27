//
//  HomeCollectionCell.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeCollectionCategoryCell : UICollectionViewCell

@property (nonatomic, strong) HomeSortModel *sortModel;
@property (nonatomic, strong) HomeRecommendModel *recommendModel;

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index;

@end
