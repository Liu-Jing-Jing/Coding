
//
//  ShelfController.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/3.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ShelfController.h"
#import "ShelfView.h"
#import "DetailView.h"

#pragma mark - 声明
@interface ShelfController ()

@property (nonatomic, strong) ShelfView *shelf;
@property (nonatomic, strong) DetailView *detailView;

@end

#pragma mark - 实现
@implementation ShelfController

- (void)viewDidLoad {
    [super viewDidLoad];
    _detailView = [DetailView init];
    [self.view addSubview:_detailView];
}
//- (void)loadView {
//    self.view = [self shelf];
//}
//- (ShelfView *)shelf {
//    if (!_shelf) {
//        _shelf = [ShelfView init];
//    }
//    return _shelf;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_detailView show];
}

@end
