//
//  FindController.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/3.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "FindController.h"
#import "FindView.h"

#pragma mark - 声明
@interface FindController ()

@property (nonatomic, strong) FindView *find;

@end

#pragma mark - 实现
@implementation FindController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)loadView {
    self.view = [self find];
}
- (FindView *)find {
    if (!_find) {
        _find = [FindView init];
    }
    return _find;
}


@end
