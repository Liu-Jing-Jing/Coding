//
//  HomeControl.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeControl.h"
#import "HomeCell.h"

#pragma mark - 声明
@interface HomeControl()

@property (nonatomic, strong) HomeCell *cell;

@end

#pragma mark - 实现
@implementation HomeControl

- (void)initUI {
    [self setAlpha:0];
    [self setUserInteractionEnabled:NO];
    [self cell];
    [self setBackgroundColor:[UIColor yellowColor]];
}
- (HomeCell *)cell {
    if (!_cell) {
        _cell = [HomeCell loadCode:CGRectMake(0, 0, ScreenWidth / 4, ScreenWidth / 4)];
        _cell.centerX = self.centerX;
        [self addSubview:_cell];
    }
    return _cell;
}

@end
