//
//  HomeSectionHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeSectionCategoryHeader.h"

#pragma mark - 声明
@interface HomeSectionCategoryHeader()

@property (nonatomic, strong) UIButton *icon;

@end

#pragma mark - 实现
@implementation HomeSectionCategoryHeader

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    HomeSectionCategoryHeader *view = [HomeSectionCategoryHeader loadCode:collection kind:kind index:index];
    [view setBackgroundColor:LightColor];
    [view icon];
    [view createLayout];
    return view;
}
- (void)createLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(countcoordinatesX(-10));
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(countcoordinatesX(30));
    }];
}
- (UIButton *)icon {
    if (!_icon) {
        _icon = [UIButton buttonWithType:UIButtonTypeCustom];
        _icon.backgroundColor = MediumColor;
        [self addSubview:_icon];
    }
    return _icon;
}

@end
