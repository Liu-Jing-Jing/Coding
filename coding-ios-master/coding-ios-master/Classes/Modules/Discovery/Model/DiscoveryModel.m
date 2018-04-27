//
//  DiscoveryModel.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryModel.h"

@implementation DiscoveryRecommendModel

@end


@implementation DiscoveryModel

+ (NSDictionary *)objectClassInArray {
    return @{
             @"ad"        : [AdModel class],
             @"recommend" : [DiscoveryRecommendModel class],
             @"article"   : [EssayModel class],
             };
}

@end

