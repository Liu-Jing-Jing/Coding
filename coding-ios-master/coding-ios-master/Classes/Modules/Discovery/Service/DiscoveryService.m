//
//  DiscoveryService.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoveryService.h"

@implementation DiscoveryService

+ (void)serviceRequestWithPage:(NSInteger)page success:(SuccessDiscoveryServiceBlock)success error:(ErrorNetWorkBlock)error {
    [AFNManager GET:[NSString getDiscoveryList] params:nil success:^(NSDictionary *data) {
        DiscoveryModel *model = [DiscoveryModel mj_objectWithKeyValues:data];
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
