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
@property (nonatomic, strong) UIButton *nextBtn;

@end

#pragma mark - 实现
@implementation HomeSectionNextHeader

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    HomeSectionNextHeader *view = [HomeSectionNextHeader loadCode:collection kind:kind index:index];
    [view setBackgroundColor:WhiteColor];
    [view line];
    [view name];
    [view icon];
    [view next];
    [view nextBtn];
    [view createLayout];
    return view;
}
- (void)createLayout {
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(countcoordinatesX(10));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(self.name.mas_height);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.line.mas_right).mas_equalTo(countcoordinatesX(10));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5);
    }];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(countcoordinatesX(-10));
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(20);
    }];
    [self.next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.icon.mas_left).mas_equalTo(countcoordinatesX(0));
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(50);
    }];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.icon.mas_right);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.mas_equalTo(self.next.mas_left);
    }];
}
- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = BoldColor;
        _line.layer.cornerRadius = 1;
        _line.layer.masksToBounds = YES;
        [self addSubview:_line];
    }
    return _line;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:adjustFont(12)];
        _name.textColor = ColorTextHeavy;
        [self addSubview:_name];
    }
    return _name;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.contentMode = UIViewContentModeScaleAspectFit;
        _icon.image = [UIImage imageNamed:@"next"];
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)next {
    if (!_next) {
        _next = [[UILabel alloc] init];
        _next.textAlignment = NSTextAlignmentRight;
        _next.text = @"更多";
        _next.font = [UIFont systemFontOfSize:adjustFont(12)];
        _next.textColor = ColorTextHeavy;
        [self addSubview:_next];
    }
    return _next;
}
- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_nextBtn];
    }
    return _nextBtn;
}

#pragma mark - 设置
- (void)setHeaderStr:(NSString *)headerStr {
    _headerStr = headerStr;
    _name.text = headerStr;
}

@end
