//
//  HomeCollectionTechnicalCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionTechnicalCell.h"

#pragma mark - 声明
@interface HomeCollectionTechnicalCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;

@end

#pragma mark - 实现
@implementation HomeCollectionTechnicalCell

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionTechnicalCell *cell = [HomeCollectionTechnicalCell loadCode:collection index:index];
    [cell setBackgroundColor:MediumColor];
    [cell icon];
    [cell name];
    [cell createLayout];
    return cell;
}
- (void)createLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).mas_equalTo(8);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.4);
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.4);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.icon.mas_bottom).mas_equalTo(3);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.4);
        make.bottom.mas_equalTo(-8);
    }];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = BoldColor;
        _icon.layer.cornerRadius = 1;
        _icon.layer.masksToBounds = YES;
        _icon.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.backgroundColor = BoldColor;
        _name.layer.cornerRadius = 1;
        _name.layer.masksToBounds = YES;
        _name.textAlignment = NSTextAlignmentCenter;
        _name.textColor = ColorTextHeavy;
        _name.font = FontName(10);
        [self.contentView addSubview:_name];
    }
    return _name;
}

#pragma mark - 设置
- (void)setModel:(HomeTechnicalModel *)model {
    _model = model;
    _icon.image = [UIImage imageNamed:model.image];
    _name.text = model.name;
}

@end
