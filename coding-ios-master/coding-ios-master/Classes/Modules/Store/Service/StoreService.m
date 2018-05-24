//
//  StoreService.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreService.h"

@implementation StoreService

+ (void)getStoreList:(NSString *)lid complete:(ServiceComplete)complete {
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:lid, @"lid", nil];
//    [AFNManager GET:[NSString getStoreList] params:param success:^(NSDictionary *data) {
//
//    } error:^(NSError *error) {
//        BaseModel *model = [[BaseModel alloc] init];
//        model.r =
//    }];
}

@end
