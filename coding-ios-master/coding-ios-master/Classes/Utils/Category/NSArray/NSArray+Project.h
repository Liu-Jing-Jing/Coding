//
//  NSArray+Project.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRLChannelUnitModel.h"

@interface NSArray (Project)

+ (NSArray<LRLChannelUnitModel *> *)getTopChannelArr;
+ (NSArray<LRLChannelUnitModel *> *)getBottomChannelArr;

@end
