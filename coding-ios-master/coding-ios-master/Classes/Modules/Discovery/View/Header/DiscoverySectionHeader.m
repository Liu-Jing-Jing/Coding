//
//  DiscoverySectionHeader.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DiscoverySectionHeader.h"

@implementation DiscoverySectionHeader

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    DiscoverySectionHeader *view = [DiscoverySectionHeader loadCode:collection kind:kind index:index];
    view.backgroundColor = MediumColor;
    return view;
}

@end
