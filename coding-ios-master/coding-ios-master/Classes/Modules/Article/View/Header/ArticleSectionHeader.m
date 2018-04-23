//
//  ArticleSectionHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleSectionHeader.h"

#pragma mark - 声明
@interface ArticleSectionHeader()

@property (nonatomic, strong) UILabel *first;

@end

#pragma mark - 实现
@implementation ArticleSectionHeader

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    ArticleSectionHeader *view = [ArticleSectionHeader loadCode:collection kind:kind index:index];
    [view setBackgroundColor:LightColor];
    [view first];
    return view;
}
- (UILabel *)first {
    if (!_first) {
        _first = [[UILabel alloc] initWithFrame:({
            CGRectMake(0, 0, ScreenWidth / 6, self.height);
        })];
        _first.centerX = self.centerX;
        _first.centerY = self.height / 2;
        _first.textAlignment = NSTextAlignmentCenter;
        _first.backgroundColor = MediumColor;
        [self addSubview:_first];
    }
    return _first;
}

@end
