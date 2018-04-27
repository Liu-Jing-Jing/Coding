//
//  NSString+API.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "NSString+API.h"

@implementation NSString (API)

// 首页列表
+ (NSString *)getHomeList {
    return [NSString stringWithFormat:@"http://127.0.0.1:3003/home_list"];
}
// 文章列表
+ (NSString *)getArticleList {
    return [NSString stringWithFormat:@"http://127.0.0.1:3003/article_list"];
}
// 发现列表
+ (NSString *)getDiscoveryList {
    return [NSString stringWithFormat:@"http://127.0.0.1:3003/discovery_list"];
}

@end
