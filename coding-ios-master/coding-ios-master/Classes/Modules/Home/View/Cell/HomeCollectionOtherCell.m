//
//  HomeCollectionOtherCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionOtherCell.h"

#pragma mark - 声明
@interface HomeCollectionOtherCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;

@end

#pragma mark - 实现
@implementation HomeCollectionOtherCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionOtherCell *cell = [HomeCollectionOtherCell loadCode:collection index:index];
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
        [self.contentView addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.backgroundColor = BoldColor;
        [self.contentView addSubview:_name];
    }
    return _name;
}

@end
