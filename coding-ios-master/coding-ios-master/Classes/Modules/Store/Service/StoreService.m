//
//  StoreService.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreService.h"
#import "StoreModel.h"

@implementation StoreService

+ (void)getStoreList:(NSInteger)lid complete:(ServiceComplete)complete {
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:@(lid), @"lid", nil];
    [AFNManager GET:[NSString getStoreList] params:param complete:^(APPResult *result) {
        if (complete) {
            StoreModel *model = [StoreModel mj_objectWithKeyValues:result.data];
            complete(model, result.result);
        }
    }];
}

@end
