//
//  HomeModel.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeModel.h"


/// 轮播图
@implementation HomeAdModel

@end

/// 技术点
@implementation HomeTechnicalModel

@end


/// Tag
@implementation HomeTagModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id",
             };
}

@end


/// 分类
@implementation HomeCategoryModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id",
             };
}

@end


/// 类别
@implementation HomeSortModel


@end

/// 推荐
@implementation HomeRecommendModel


@end


/// 热门
@implementation HomeHotModel

+ (NSDictionary *)objectClassInArray {
    return @{
             @"tag" : [HomeTagModel class],
             @"category" : [HomeCategoryModel class]
             };
}

@end


/// 首页Model
@implementation HomeModel

+ (NSDictionary *)objectClassInArray {
    return @{
                 @"ad"        : [HomeAdModel class],
                 @"technical" : [HomeTechnicalModel class],
                 @"sort"      : [HomeSortModel class],
                 @"recommend" : [HomeRecommendModel class],
                 @"hot"       : [HomeHotModel class],
             };
}

@end
