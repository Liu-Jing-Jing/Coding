//
//  ArticleService.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleService.h"

@implementation ArticleService

+ (void)serviceRequestWithPage:(NSInteger)page success:(SuccessArticleServiceBlock)success error:(ErrorNetWorkBlock)error {
    [AFNManager GET:[NSString getArticleList] params:nil success:^(NSDictionary *data) {
        ArticleModel *model = [ArticleModel mj_objectWithKeyValues:data];
        if (success) {
            success(model);
        }
    } error:^(NSError *err) {
        if (error) {
            error(err);
        }
    }];
}

@end
