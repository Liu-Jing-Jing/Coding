//
//  StoreController.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/3.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreController.h"
#import "StoreView.h"

#pragma mark - 声明
@interface StoreController ()

@property (nonatomic, strong) StoreView *store;

@end

#pragma mark - 实现
@implementation StoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)loadView {
    self.view = [self store];
}
- (StoreView *)store {
    if (!_store) {
        _store = [StoreView init];
    }
    return _store;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}


@end
