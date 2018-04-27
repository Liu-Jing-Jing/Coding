//
//  DiscoveryCollectionThemeView.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryCollectionThemeView.h"

#pragma mark - 声明
@interface DiscoveryCollectionThemeView ()

@end

#pragma mark - 实现
@implementation DiscoveryCollectionThemeView

+ (instancetype)initWithFrame:(CGRect)frame {
    DiscoveryCollectionThemeView *view = [DiscoveryCollectionThemeView loadCode:frame];
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
