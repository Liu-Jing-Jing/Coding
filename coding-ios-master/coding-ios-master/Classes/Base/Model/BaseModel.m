//
//  BaseModel.m
//  iOS
//
//  Created by 郑业强 on 2018/4/1.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "BaseModel.h"
#import <MJExtension/MJExtension.h>

/// Tag
@implementation AdModel

@end

/// Tag
@implementation TagModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id",
             };
}

@end

/// 分类
@implementation CategoryModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id",
             };
}

@end

/// 技术点
@implementation TechnicalModel

@end

// 文章
@implementation EssayModel

@end


@implementation BaseModel

@end
