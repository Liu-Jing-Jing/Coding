//
//  WatchView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "WatchView.h"
#import "UIView+Watch.h"

#pragma mark - 声明
@interface WatchView()

@property (nonatomic, strong) UIImageView *eye;
@property (nonatomic, strong) UILabel *name;

@end

#pragma mark - 实现
@implementation WatchView

+ (instancetype)initWithFrame:(CGRect)frame {
    WatchView *view = [[WatchView alloc] initWithFrame:frame];
    [view eye];
    [view name];
    [view createView];
    return view;
}
+ (instancetype)initWithMasonry {
    WatchView *view = [[WatchView alloc] init];
    [view eye];
    [view name];
    [view createLayout];
    return view;
}

- (UIImageView *)eye {
    if (!_eye) {
        _eye = [[UIImageView alloc] init];
        _eye.backgroundColor = MediumColor;
        [self addSubview:_eye];
    }
    return _eye;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.backgroundColor = MediumColor;
        [self addSubview:_name];
    }
    return _name;
}

- (void)createView {
    _eye.frame = CGRectMake(0, 0, self.height, self.height);
    _eye.backgroundColor = [UIColor redColor];
    _name.frame = ({
        CGFloat left = CGRectGetMaxY(_eye.frame) + countcoordinatesX(3);
        CGRectMake(left, 0, self.width - left, self.height);
    });
    _name.backgroundColor = [UIColor orangeColor];
}
- (void)createLayout {
    [self.eye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(self.mas_height);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.eye.mas_right).mas_equalTo(countcoordinatesX(3));
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(self.mas_height);
    }];
}

@end
