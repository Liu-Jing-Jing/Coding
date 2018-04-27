//
//  ColumnView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/27.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ColumnView.h"

#pragma mark - 声明
@interface ColumnView()

@property (nonatomic, strong) UILabel *column;
@property (nonatomic, strong) UILabel *desc;
@property (nonatomic, strong) UIImageView *back;

@end

#pragma mark - 实现
@implementation ColumnView

+ (instancetype)init {
    ColumnView *view = [ColumnView loadCode:ScreenBounds];
    [view setTop:-ScreenHeight];
    [view setBackgroundColor:[UIColor blackColor]];
    [view column];
    [view desc];
    [view back];
    return view;
}
- (UILabel *)column {
    if (!_column) {
        _column = [[UILabel alloc] init];
        _column.frame = CGRectMake(0, countcoordinatesY(40), ScreenWidth, 20);
        _column.textColor = [UIColor whiteColor];
        _column.text = @"--- 我的栏目 ---";
        _column.textAlignment = NSTextAlignmentCenter;
        _column.font = [UIFont systemFontOfSize:adjustFont(14)];
        [self addSubview:_column];
    }
    return _column;
}
- (UILabel *)desc {
    if (!_desc) {
        _desc = [[UILabel alloc] init];
        _desc.frame = CGRectMake(0, CGRectGetMaxY(_column.frame) + countcoordinatesY(10), ScreenWidth, 20);
        _desc.text = @"默认显示前三个, 长按拖拽调整栏目顺序";
        _desc.textColor = [UIColor whiteColor];
        _desc.textAlignment = NSTextAlignmentCenter;
        _desc.font = [UIFont systemFontOfSize:adjustFont(10) weight:UIFontWeightLight];
        [self addSubview:_desc];
    }
    return _desc;
}
- (UIImageView *)back {
    if (!_back) {
        MJWeakSelf
        _back = [[UIImageView alloc] init];
        _back.frame = CGRectMake(0, ScreenHeight - 50, 40, 30);
        _back.centerX = self.centerX;
        _back.image = [UIImage imageNamed:@"close_topic_30x30_"];
        _back.contentMode = UIViewContentModeScaleAspectFit;
        _back.userInteractionEnabled = YES;
        [_back addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weakSelf hide];
        }];
        [self addSubview:_back];
    }
    return _back;
}

#pragma mark - 动作
- (void)show {
    self.top = -ScreenHeight;
    self.hidden = NO;
    MJWeakSelf
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        weakSelf.top = 0;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide {
    MJWeakSelf
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        weakSelf.top = -ScreenHeight;
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}

@end
