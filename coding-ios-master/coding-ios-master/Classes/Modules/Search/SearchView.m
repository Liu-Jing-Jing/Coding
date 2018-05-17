//
//  SearchView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SearchView.h"

#pragma mark - 声明
@interface SearchView ()

@property (nonatomic, strong) UITableView *table;

@end

#pragma mark - 实现
@implementation SearchView

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    SearchView *view = [SearchView loadCode:frame];
    return view;
}
- (UITableView *)table {
    if (!_table) {
        <#statements#>
    }
    return _table;
}

@end
