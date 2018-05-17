//
//  CategoryController.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "CategoryController.h"
#import "CategoryView.h"

#pragma mark - 声明
@interface CategoryController ()

@property (nonatomic, strong) CategoryView *category;

@end

#pragma mark - 实现
@implementation CategoryController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)loadView {
    self.view = [self category];
}
- (CategoryView *)category {
    if (!_category) {
        _category = [CategoryView init];
    }
    return _category;
}


@end
