//
//  DetailController.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailController.h"
#import "DetailView.h"

#pragma mark - 声明
@interface DetailController ()

@property (nonatomic, strong) DetailView *detailView;

@end

#pragma mark - 实现
@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)loadView {
    self.view = [self detailView];
}
- (DetailView *)detailView {
    if (!_detailView) {
        _detailView = [DetailView init];
    }
    return _detailView;
}


@end
