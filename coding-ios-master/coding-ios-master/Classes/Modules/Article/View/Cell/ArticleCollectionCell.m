//
//  ArticleCollectionCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleCollectionCell.h"

#pragma mark - 声明
@interface ArticleCollectionCell()

@property (nonatomic, copy  ) UIImageView *icon;
@property (nonatomic, copy  ) UILabel *name;
@property (nonatomic, copy  ) UILabel *category;

@end

#pragma mark - 实现
@implementation ArticleCollectionCell

#pragma mark - 设置
- (void)setModel:(ArticleArticleModel *)model {
    _model = model;
}

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    ArticleCollectionCell *cell = [ArticleCollectionCell loadCode:collection index:index];
    [cell createView];
    return cell;
}
- (void)createView {
    [self setBackgroundColor:MediumColor];
    [self icon];
    [self name];
    [self category];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        [self addSubview:_name];
    }
    return _name;
}
- (UILabel *)category {
    if (!_category) {
        _category = [[UILabel alloc] init];
        [self addSubview:_category];
    }
    return _category;
}

@end
