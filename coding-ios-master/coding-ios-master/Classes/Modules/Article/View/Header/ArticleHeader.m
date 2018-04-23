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

@property (nonatomic, strong) SDCycleScrollView *scroll;

@end

#pragma mark - 实现
@implementation ArticleHeader

+ (instancetype)initWithFrame:(CGRect)frame {
    ArticleHeader *view = [ArticleHeader loadCode:frame];
    [view setBackgroundColor:LightColor];
    [view scroll];
    return view;
}
- (SDCycleScrollView *)scroll {
    if (!_scroll) {
        _scroll = [SDCycleScrollView initWithFrame:self.bounds];
        [self addSubview:_scroll];
    }
    return _scroll;
}

#pragma mark - 设置
- (void)setModels:(NSArray<ArticleAdModel *> *)models {
    _models = models;
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (ArticleAdModel *model in models) {
        [arr addObject:model.image];
    }
    _scroll.imageURLStringsGroup = arr;
}

@end
