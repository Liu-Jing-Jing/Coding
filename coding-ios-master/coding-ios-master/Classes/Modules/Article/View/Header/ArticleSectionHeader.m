//
//  ArticleSectionHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleSectionHeader.h"

@implementation ArticleSectionHeader

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    ArticleSectionHeader *view = [ArticleSectionHeader loadCode:collection kind:kind index:index];
    view.backgroundColor = LightColor;
    return view;
}

@end
