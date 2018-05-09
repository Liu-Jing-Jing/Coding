//
//  DetailView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DetailView.h"
#import "DetailContent.h"

#pragma mark - 声明
@interface DetailView ()

@property (weak, nonatomic) IBOutlet UIView *shadow;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (nonatomic, strong) DetailContent *content;

@end

#pragma mark - 实现
@implementation DetailView

#pragma mark - 初始化
+ (instancetype)init {
    DetailView *view = [DetailView loadCode:ScreenBounds];
    [view createView];
    return view;
}
- (void)createView {
    [self content];
}
- (DetailContent *)content {
    if (!_content) {
        _content = [DetailContent initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        [_scroll addSubview:_content];
    }
    return _content;
}



@end
