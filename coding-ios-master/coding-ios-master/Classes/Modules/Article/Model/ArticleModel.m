//
//  ArticleModel.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleAdModel

@end


@implementation ArticleArticleModel

+ (NSDictionary *)objectClassInArray {
    return @{
             @"category" : [CategoryModel class],
             };
}

@end


@implementation ArticleModel

+ (NSDictionary *)objectClassInArray {
    return @{
             @"ad"        : [ArticleAdModel class],
             @"technical" : [TechnicalModel class],
             @"article"   : [ArticleArticleModel class],
             };
}

@end
