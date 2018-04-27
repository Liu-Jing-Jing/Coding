//
//  ArticleCollectionNameCell.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleModel.h"

@interface ArticleCollectionNameCell : UICollectionViewCell

@property (nonatomic, strong) EssayModel *model;

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index;

@end
