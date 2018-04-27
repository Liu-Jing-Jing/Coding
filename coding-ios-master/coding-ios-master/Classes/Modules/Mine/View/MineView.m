//
//  DiscoveryView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineView.h"

#pragma mark - 声明
@interface MineView()

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIButton *login;
@property (nonatomic, strong) UILabel *desc;

@end

#pragma mark - 实现
@implementation MineView

#pragma mark - 初始化
+ (instancetype)init {
    MineView *view = [MineView loadCode:ScreenBounds];
    [view setBackgroundColor:WhiteColor];
    [view name];
    [view icon];
    [view login];
    [view desc];
    [view createLayout];
    return view;
}
- (void)createLayout {
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.height * 0.2);
        make.centerX.mas_equalTo(self.mas_centerX).mas_equalTo(countcoordinatesX(15));
    }];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.name.mas_left).mas_equalTo(countcoordinatesY(-10));
        make.width.and.height.mas_equalTo(countcoordinatesX(40));
        make.centerY.mas_equalTo(self.name.mas_centerY);
    }];
    [self.login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(self.mas_width).multipliedBy(0.25);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [self.desc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.login.mas_bottom).mas_equalTo(countcoordinatesY(30));
        make.width.mas_equalTo(self.mas_width);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = LightColor;
        _icon.layer.cornerRadius = 5;
        _icon.layer.masksToBounds = YES;
        [_icon shadowWithColor:ColorTextBold offset:CGSizeMake(1, 1) opacity:0.2 radius:1];
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.text = @"奇点日报";
        [self addSubview:_name];
    }
    return _name;
}
- (UIButton *)login {
    if (!_login) {
        _login = [UIButton buttonWithType:UIButtonTypeCustom];
        _login.backgroundColor = LightColor;
        _login.layer.cornerRadius = ScreenWidth / 4 / 2;
        _login.layer.masksToBounds = YES;
        [self addSubview:_login];
    }
    return _login;
}
- (UILabel *)desc {
    if (!_desc) {
        _desc = [[UILabel alloc] init];
        _desc.numberOfLines = 0;
        _desc.textAlignment = NSTextAlignmentCenter;
        _desc.attributedText = [NSAttributedString attributedWithLineSpacing:5 color:ColorTextMedium font:[UIFont systemFontOfSize:adjustFont(12) weight:UIFontWeightLight] str:@"在这个互联网泛滥的时代\n安心如此简单"];
        [self addSubview:_desc];
    }
    return _desc;
}

@end

