//
//  ArticleModel.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleModel.h"


@implementation ArticleModel

+ (NSDictionary *)objectClassInArray {
    return @{
             @"ad"        : [AdModel class],
             @"technical" : [TechnicalModel class],
             @"article"   : [EssayModel class],
             };
}

@end
