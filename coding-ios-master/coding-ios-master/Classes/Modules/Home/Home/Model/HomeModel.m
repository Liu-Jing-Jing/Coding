//
//  HomeModel.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeModel.h"

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
             @"tag" : [TagModel class],
             };
}

@end

/// 首页Model
@implementation HomeModel

+ (NSDictionary *)objectClassInArray {
    return @{
                 @"ad"        : [AdModel class],
                 @"technical" : [TechnicalModel class],
                 @"sort"      : [HomeSortModel class],
                 @"recommend" : [HomeRecommendModel class],
                 @"hot"       : [HomeHotModel class],
                 @"column"    : [ColumnModel class],
             };
}

@end
