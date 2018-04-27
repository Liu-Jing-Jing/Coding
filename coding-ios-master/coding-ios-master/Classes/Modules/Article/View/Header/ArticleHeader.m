//
//  ArticleHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleHeader.h"

#pragma mark - 声明
@interface ArticleHeader()

@property (nonatomic, strong) UIImageView *icon;

@end

#pragma mark - 实现
@implementation ArticleHeader

+ (instancetype)initWithFrame:(CGRect)frame {
    ArticleHeader *view = [ArticleHeader loadCode:frame];
    [view setBackgroundColor:LightColor];
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

#pragma mark - 设置
- (void)setModels:(NSArray<AdModel *> *)models {
    _models = models;
    [_icon sd_setImageWithURL:[NSURL URLWithString:models[0].image]];
}

@end
