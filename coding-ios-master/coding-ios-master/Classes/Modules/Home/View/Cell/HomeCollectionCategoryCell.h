//
//  HomeCollectionCell.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCollectionCategoryCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIImageView *eye;
@property (nonatomic, strong) UIView *eyeBg;
@property (nonatomic, strong) UILabel *number;
@property (nonatomic, strong) UILabel *desc;

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index;

@end
