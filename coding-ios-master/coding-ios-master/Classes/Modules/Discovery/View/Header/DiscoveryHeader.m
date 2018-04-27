//
//  DiscoveryHeader.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryHeader.h"

#pragma mark - 声明
@interface DiscoveryHeader()

@property (nonatomic, strong) UIImageView *icon;

@end

#pragma mark - 实现
@implementation DiscoveryHeader

#pragma mark - 设置
- (void)setModel:(AdModel *)model {
    _model = model;
    [_icon setWithImageURL:model.image options:SDWebImageDownloaderLowPriority progress:nil completion:nil];
}

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    DiscoveryHeader *view = [DiscoveryHeader loadCode:frame];
    [view setBackgroundColor:MediumColor];
    [view icon];
    return view;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_icon];
    }
    return _icon;
}


@end
