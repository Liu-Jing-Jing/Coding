//
//  HomeModel.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeModel.h"

/// 其他
@implementation HomeTechnicalModel

@end

/// 轮播图
@implementation HomeAdModel

@end

/// 推荐
@implementation HomeRecommendModel

@end

/// 首页Model
@implementation HomeModel

+ (NSDictionary *)objectClassInArray{
    return @{
                 @"ad" : [HomeAdModel class],
                 @"technical" : [HomeTechnicalModel class],
                 @"recommend" : [HomeRecommendModel class]
             };
}

@end
