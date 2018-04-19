//
//  PushSectionHeader.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "PushSectionHeader.h"

@implementation PushSectionHeader

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    PushSectionHeader *view = [PushSectionHeader loadCode:collection kind:kind index:index];
    view.backgroundColor = LightColor;
    return view;
}

@end
