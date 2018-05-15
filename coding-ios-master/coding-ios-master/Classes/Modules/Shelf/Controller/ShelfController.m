
//
//  ShelfController.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/3.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ShelfController.h"
#import "ShelfView.h"

#pragma mark - 声明
@interface ShelfController ()

@property (nonatomic, strong) ShelfView *shelf;

@end

#pragma mark - 实现
@implementation ShelfController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)loadView {
    self.view = [self shelf];
}
- (ShelfView *)shelf {
    if (!_shelf) {
        _shelf = [ShelfView init];
    }
    return _shelf;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
