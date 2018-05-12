//
//  DetailContent.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailContent.h"

#pragma mark - 声明
@interface DetailContent ()

// 背景
@property (weak, nonatomic) IBOutlet UIView *bg;
// 姓名
@property (weak, nonatomic) IBOutlet UILabel *name;
// 作者
@property (weak, nonatomic) IBOutlet UILabel *author;
// 为您推荐
@property (weak, nonatomic) IBOutlet UILabel *recommendL;

@end

#pragma mark - 实现
@implementation DetailContent

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    DetailContent *view = [DetailContent loadLastNib:frame];
    [view createView];
    return view;
}
- (void)createView {
    [self setBackgroundColor:[UIColor whiteColor]];
    [self sendSubviewToBack:_bg];
    [self setHeight:CGRectGetMaxY(_recommendL.frame) + 100];
}

@end
