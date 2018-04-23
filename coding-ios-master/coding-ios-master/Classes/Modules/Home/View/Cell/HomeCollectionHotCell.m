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

@end

#pragma mark - 实现
@implementation HomeCollectionHotCell

#pragma mark - 设置
- (void)setModel:(HomeHotModel *)model {
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.image]];
}

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionHotCell *cell = [HomeCollectionHotCell loadCode:collection index:index];
    [cell setBackgroundColor:MediumColor];
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
}
- (void)createLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make
    }];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        [self.contentView addSubview:_name];
    }
    return _name;
}
- (UIImageView *)eye {
    if (!_eye) {
        _eye = [[UIImageView alloc] init];
        [self.contentView addSubview:_eye];
    }
    return _eye;
}
- (UILabel *)number {
    if (!_number) {
        _number = [[UILabel alloc] init];
        [self.contentView addSubview:_number];
    }
    return _number;
}
- (UILabel *)tags {
    if (!_tags) {
        _tags = [[UILabel alloc] init];
        [self.contentView addSubview:_tags];
    }
    return _tags;
}

@end
