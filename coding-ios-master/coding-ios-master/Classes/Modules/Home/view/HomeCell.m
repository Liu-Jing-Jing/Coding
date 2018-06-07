//
//  HomeCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCell.h"

#pragma mark - 声明
@interface HomeCell ()

@property (nonatomic, strong) UIImageView *icon;

@end

#pragma mark - 实现
@implementation HomeCell

- (void)initUI {
    [self icon];
    [self setBackgroundColor:[UIColor orangeColor]];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width / 3, self.width / 3)];
        _icon.backgroundColor = [UIColor redColor];
        _icon.center = CGPointMake(self.width / 2, self.height / 2);
        _
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

@end
