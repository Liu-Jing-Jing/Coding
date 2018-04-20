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

@end

#pragma mark - 实现
@implementation HomeCollectionCategoryCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionCategoryCell *cell = [HomeCollectionCategoryCell loadCode:collection index:index];
    [cell setBackgroundColor:MediumColor];
    [cell icon];
    [cell eyeBg];
    [cell eye];
    [cell number];
    [cell desc];
    [cell createLayout];
    return cell;
}
- (void)createLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.75);
    }];
    [self.eyeBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(self.icon.mas_bottom);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(self.mas_width);
    }];
    [self.eye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(countcoordinatesX(5));
        make.top.mas_equalTo(self.eyeBg.mas_top);
        make.height.and.width.mas_equalTo(self.eyeBg.mas_height);
    }];
    [self.number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.eye.mas_right).mas_equalTo(countcoordinatesX(5));
        make.top.mas_equalTo(self.eyeBg.mas_top);
        make.height.mas_equalTo(self.eyeBg.mas_height);
        make.right.mas_equalTo(self.eyeBg.mas_right);
    }];
    [self.desc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.mas_width);
        make.top.mas_equalTo(self.icon.mas_bottom);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = LightColor;
        [self addSubview:_icon];
    }
    return _icon;
}
- (UIView *)eyeBg {
    if (!_eyeBg) {
        _eyeBg = [[UIView alloc] init];
        _eyeBg.backgroundColor = BoldColor;
        [self addSubview:_eyeBg];
    }
    return _eyeBg;
}
- (UIImageView *)eye {
    if (!_eye) {
        _eye = [[UIImageView alloc] init];
        _eye.backgroundColor = HeavyColor;
        [self.eyeBg addSubview:_eye];
    }
    return _eye;
}
- (UILabel *)number {
    if (!_number) {
        _number = [[UILabel alloc] init];
        _number.backgroundColor = HeavyColor;
        [self.eyeBg addSubview:_number];
    }
    return _number;
}
- (UILabel *)desc {
    if (!_desc) {
        _desc = [[UILabel alloc] init];
        _desc.backgroundColor = LightColor;
        [self addSubview:_desc];
    }
    return _desc;
}


@end
