//
//  HomeCollectionCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionCategoryCell.h"

#pragma mark - 声明
@interface HomeCollectionCategoryCell ()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIImageView *eye;
@property (nonatomic, strong) UIView *eyeBg;
@property (nonatomic, strong) UILabel *number;
@property (nonatomic, strong) UILabel *name;

@end

#pragma mark - 实现
@implementation HomeCollectionCategoryCell

#pragma mark - 设置
- (void)setRecommendModel:(HomeRecommendModel *)recommendModel {
    _recommendModel = recommendModel;
    _name.text = recommendModel.title;
    [_icon sd_setImageWithURL:[NSURL URLWithString:_recommendModel.image]];
    [UILabel changeLineSpaceForLabel:_name WithSpace:5];
    _number.text = [@(recommendModel.number) description];
}
- (void)setSortModel:(HomeSortModel *)sortModel {
    _sortModel = sortModel;
    _name.text = sortModel.title;
    [_icon sd_setImageWithURL:[NSURL URLWithString:sortModel.image]];
    [UILabel changeLineSpaceForLabel:_name WithSpace:5];
    _number.text = [@(sortModel.number) description];
}

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionCategoryCell *cell = [HomeCollectionCategoryCell loadCode:collection index:index];
    [cell setBackgroundColor:WhiteColor];
    [cell icon];
    [cell eyeBg];
    [cell eye];
    [cell number];
    [cell name];
    [cell createLayout];
    return cell;
}
- (void)createLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.7);
    }];
    [self.eyeBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(self.icon.mas_bottom);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(self.mas_width);
    }];
    [self.eye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(countcoordinatesX(5));
        make.centerY.mas_equalTo(self.eyeBg.mas_centerY);
        make.height.and.width.mas_equalTo(self.eyeBg.mas_height).multipliedBy(0.7);
    }];
    [self.number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.eye.mas_right).mas_equalTo(countcoordinatesX(5));
        make.top.mas_equalTo(self.eyeBg.mas_top);
        make.height.mas_equalTo(self.eyeBg.mas_height);
        make.right.mas_equalTo(self.eyeBg.mas_right);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.mas_width);
        make.top.mas_equalTo(self.icon.mas_bottom);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self addSubview:_icon];
    }
    return _icon;
}
- (UIView *)eyeBg {
    if (!_eyeBg) {
        _eyeBg = [[UIView alloc] init];
        [self addSubview:_eyeBg];
    }
    return _eyeBg;
}
- (UIImageView *)eye {
    if (!_eye) {
        _eye = [[UIImageView alloc] init];
        _eye.contentMode = UIViewContentModeScaleToFill;
        _eye.image = [UIImage imageNamed:@"eye"];
        [self.eyeBg addSubview:_eye];
    }
    return _eye;
}
- (UILabel *)number {
    if (!_number) {
        _number = [[UILabel alloc] init];
        [_number eyeFontAndColor];
        [self.eyeBg addSubview:_number];
    }
    return _number;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.numberOfLines = 0;
        [_name titleFontAndColor];
        [self addSubview:_name];
    }
    return _name;
}


@end
