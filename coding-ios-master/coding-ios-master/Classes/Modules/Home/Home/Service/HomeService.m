//
//  ArticleService.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeService.h"

@implementation HomeService

+ (void)serviceRequest:(SuccessHomeServiceBlock)success error:(ErrorNetWorkBlock)error {
    [AFNManager GET:[NSString getHomeList] params:nil success:^(NSDictionary *data) {
        HomeModel *model = [HomeModel mj_objectWithKeyValues:data];
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
