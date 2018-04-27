//
//  DiscoveryCollectionRecommendCell.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoveryCollectionRecommendCell : UICollectionViewCell

@property (nonatomic, strong) NSArray<DiscoveryRecommendModel *> *models;

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index;

@end
