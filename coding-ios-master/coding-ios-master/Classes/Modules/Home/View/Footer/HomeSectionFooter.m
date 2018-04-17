//
//  HomeSectionFooter.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeSectionFooter.h"

@implementation HomeSectionFooter

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    HomeSectionFooter *view = [HomeSectionFooter loadCode:collection kind:kind index:index];
    view.backgroundColor = LightColor;
    return view;
}

@end
