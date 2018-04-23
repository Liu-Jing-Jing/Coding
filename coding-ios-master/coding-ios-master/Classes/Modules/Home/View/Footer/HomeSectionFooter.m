//
//  HomeSectionFooter.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeSectionFooter.h"

#pragma mark - 声明
@interface HomeSectionFooter ()

@property (nonatomic, strong) UIButton *more;

@end

#pragma mark - 实现
@implementation HomeSectionFooter

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    HomeSectionFooter *view = [HomeSectionFooter loadCode:collection kind:kind index:index];
    [view setBackgroundColor:LightColor];
    [view more];
    return view;
}
- (UIButton *)more {
    if (!_more) {
        _more = [UIButton buttonWithType:UIButtonTypeCustom];
        [_more setFrame:CGRectMake(0, 0, 50, 20)];
        [_more setCenter:CGPointMake(self.width / 2, self.height / 2)];
        [_more.titleLabel setFont:[UIFont systemFontOfSize:adjustFont(10)]];
        [_more setTitle:@"更多" forState:UIControlStateNormal];
        [_more setTitleColor:ColorTextBold forState:UIControlStateNormal];
        [_more.layer setCornerRadius:10];
        [_more.layer setMasksToBounds:YES];
        [_more.layer setBorderWidth:1];
        [_more.layer setBorderColor:[ColorTextMedium colorWithAlphaComponent:0.5].CGColor];
        [self addSubview:_more];
    }
    return _more;
}

@end
