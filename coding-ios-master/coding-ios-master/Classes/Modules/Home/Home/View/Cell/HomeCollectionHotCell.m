//
//  HomeCollectionNewsCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionHotCell.h"

#pragma mark - 声明
@interface HomeCollectionHotCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIImageView *eye;
@property (nonatomic, strong) UILabel *number;
@property (nonatomic, strong) UILabel *tags;
@property (nonatomic, strong) WatchView *watch;
@property (nonatomic, strong) UIView *line;

@end

#pragma mark - 实现
@implementation HomeCollectionHotCell

#pragma mark - 设置
- (void)setModel:(HomeHotModel *)model {
    _model = model;
    [_name setText:model.title];
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.image]];
}

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionHotCell *cell = [HomeCollectionHotCell loadCode:collection index:index];
    [cell setBackgroundColor:WhiteColor];
    [cell createView];
    [cell createLayout];
    return cell;
}
- (void)createView {
    [self icon];
    [self name];
    [self eye];
    [self number];
    [self tags];
    [self line];
}
- (void)createLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(countcoordinatesX(10));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.top.mas_equalTo(countcoordinatesY(10));
        make.width.mas_equalTo(self.icon.mas_height).multipliedBy(1.7);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.icon.mas_right).mas_equalTo(countcoordinatesX(10));
        make.top.mas_equalTo(self.icon.mas_top).mas_equalTo(countcoordinatesY(5));
        make.right.mas_equalTo(self.mas_right).mas_equalTo(countcoordinatesX(-10));
    }];
    [self.eye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.name.mas_left);
        make.top.mas_equalTo(self.name.mas_bottom).mas_equalTo(countcoordinatesY(20));
        make.width.and.height.mas_equalTo(countcoordinatesX(10));
    }];
    [self.number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.eye.mas_right).mas_equalTo(countcoordinatesX(5));
        make.centerY.mas_equalTo(self.eye.mas_centerY);
    }];
    [self.tags mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_equalTo(countcoordinatesX(-10));
        make.centerY.mas_equalTo(self.eye.mas_centerY);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.icon.mas_left);
        make.right.mas_equalTo(self.name.mas_right);
        make.bottom.mas_equalTo(-1);
        make.height.mas_equalTo(1);
    }];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.numberOfLines = 0;
        [_name titleFontAndColor];
        [self.contentView addSubview:_name];
    }
    return _name;
}
- (UIImageView *)eye {
    if (!_eye) {
        _eye = [[UIImageView alloc] init];
        _eye.image = [UIImage imageNamed:@"eye"];
        [self.contentView addSubview:_eye];
    }
    return _eye;
}
- (UILabel *)number {
    if (!_number) {
        _number = [[UILabel alloc] init];
        _number.text = @"658";
        [_number eyeFontAndColor];
        [self.contentView addSubview:_number];
    }
    return _number;
}
- (UILabel *)tags {
    if (!_tags) {
        _tags = [[UILabel alloc] init];
        _tags.text = @"# 其他";
        [_tags eyeFontAndColor];
        [self.contentView addSubview:_tags];
    }
    return _tags;
}
- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = ColorBg;
        [self addSubview:_line];
    }
    return _line;
}

@end
