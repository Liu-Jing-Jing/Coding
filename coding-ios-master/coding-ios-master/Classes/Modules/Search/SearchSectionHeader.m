//
//  SearchHeader.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SearchSectionHeader.h"

#pragma mark - 声明
@interface SearchSectionHeader ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *clear;

@end

#pragma mark - 实现
@implementation SearchSectionHeader

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    SearchSectionHeader *view = [SearchSectionHeader loadLastNib:frame];
    return view;
}



@end
