//
//  StoreModel.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreModel.h"


@implementation StoreSubModel

@end


@implementation StoreModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"rotation": @"StoreSubModel",
             @"recommend": @"StoreSubModel",
             @"exclusive": @"StoreSubModel",
             @"featured": @"StoreSubModel"
             };
}

@end



