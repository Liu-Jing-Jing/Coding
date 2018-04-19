//
//  HomeSectionNextHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeSectionNextHeader.h"

#pragma mark - 声明
@interface HomeSectionNextHeader()

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *next;
@property (nonatomic, strong) UIImageView *icon;

@end

#pragma mark - 实现
@implementation HomeSectionNextHeader

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    HomeSectionNextHeader *view = [HomeSectionNextHeader loadCode:collection kind:kind index:index];
    [view setBackgroundColor:LightColor];
    [view line];
    [view name];
    [view icon];
    [view next];
    [view createLayout];
    return view;
}
- (void)createLayout {
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(countcoordinatesX(10));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.5);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.line.mas_right).mas_equalTo(countcoordinatesX(10));
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5);
    }];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(countcoordinatesX(-10));
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(15);
    }];
    [self.next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.icon.mas_left).mas_equalTo(countcoordinatesX(-5));
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(50);
    }];
}
- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = BoldColor;
        [self addSubview:_line];
    }
    return _line;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.backgroundColor = BoldColor;
        [self addSubview:_name];
    }
    return _name;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = BoldColor;
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)next {
    if (!_next) {
        _next = [[UILabel alloc] init];
        _next.backgroundColor = BoldColor;
        _next.textAlignment = NSTextAlignmentRight;
        [self addSubview:_next];
    }
    return _next;
}

@end
