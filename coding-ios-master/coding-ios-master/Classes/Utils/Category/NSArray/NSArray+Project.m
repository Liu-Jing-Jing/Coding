//
//  NSArray+Project.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "NSArray+Project.h"

@implementation NSArray (Project)

+ (NSArray<LRLChannelUnitModel *> *)getTopChannelArr {
    NSArray *arr = @[@"精选",@"推荐",@"男生"];
    NSMutableArray *arrm = [[NSMutableArray alloc] init];
    for (int i=0; i<arr.count; i++) {
        LRLChannelUnitModel *model = [[LRLChannelUnitModel alloc] init];
        model.cid = [@(i) description];
        model.name = arr[i];
        [arrm addObject:model];
    }
    return arrm;
}
+ (NSArray<LRLChannelUnitModel *> *)getBottomChannelArr {
    NSArray *arr = @[@"女生",@"漫画",@"全本"];
    NSMutableArray *arrm = [[NSMutableArray alloc] init];
    for (int i=0; i<arr.count; i++) {
        LRLChannelUnitModel *model = [[LRLChannelUnitModel alloc] init];
        model.cid = [@(i) description];
        model.name = arr[i];
        [arrm addObject:model];
    }
    return arrm;
}

@end
