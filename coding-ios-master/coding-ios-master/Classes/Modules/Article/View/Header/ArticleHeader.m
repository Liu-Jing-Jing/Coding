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

@end

#pragma mark - 实现
@implementation ArticleHeader

+ (instancetype)initWithFrame:(CGRect)frame {
    ArticleHeader *view = [ArticleHeader loadCode:frame];
    view.backgroundColor = LightColor;
    return view;
}

@end
