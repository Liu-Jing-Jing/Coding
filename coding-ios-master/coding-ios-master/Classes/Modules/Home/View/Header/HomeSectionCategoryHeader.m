//
//  HomeSectionHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeSectionCategoryHeader.h"

#pragma mark - 声明
@interface HomeSectionCategoryHeader()

@property (nonatomic, strong) UILabel *lastButton;
@property (nonatomic, strong) UIButton *icon;
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) NSMutableArray<UILabel *> *btns;
@property (nonatomic, strong) UIView *line;

@end

#pragma mark - 实现
@implementation HomeSectionCategoryHeader

#pragma mark - 设置
- (void)show:(NSInteger)index time:(NSTimeInterval)time {
    
    POPBasicAnimation *labelScale = [POPBasicAnimation animation];
    labelScale.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    labelScale.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.1, 1.1)];
    labelScale.duration = time;
    [self.btns[index] pop_addAnimation:labelScale forKey:@"scaleAnimation"];
    
    POPBasicAnimation *color = [POPBasicAnimation animation];
    color.property = [POPAnimatableProperty propertyWithName:kPOPLabelTextColor];
    color.toValue  = ColorTextHeavy;
    color.duration = time;
    [self.btns[index] pop_addAnimation:color forKey:@"color"];
    
    if (_lastButton) {    
        POPBasicAnimation *labelScale2 = [POPBasicAnimation animation];
        labelScale2.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
        labelScale2.toValue  = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
        labelScale2.duration = time;
        [_lastButton pop_addAnimation:labelScale2 forKey:@"scaleAnimation"];
        
        POPBasicAnimation *color2 = [POPBasicAnimation animation];
        color2.property = [POPAnimatableProperty propertyWithName:kPOPLabelTextColor];
        color2.toValue  = ColorTextBold;
        color2.duration = time;
        [_lastButton pop_addAnimation:color2 forKey:@"color"];
    }
    
    
    
    POPBasicAnimation *left = [POPBasicAnimation animation];
    left.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
    left.fromValue = [NSValue valueWithCGPoint:CGPointMake(_lastButton.centerX, self.height - 2)];
    left.toValue  = [NSValue valueWithCGPoint:CGPointMake(self.btns[index].centerX, self.height - 2)];
    left.duration = time;
    [self.line pop_addAnimation:left forKey:@"left"];
    
    
    _lastButton = self.btns[index];
}
- (void)hide:(NSInteger)index {
    
}


#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    HomeSectionCategoryHeader *view = [HomeSectionCategoryHeader loadCode:collection kind:kind index:index];
    [view createView];
    [view createLayout];
    return view;
}
- (void)createView {
    [self setBackgroundColor:LightColor];
    [self icon];
    [self scroll];
}
- (void)createLayout {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(countcoordinatesX(-10));
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(countcoordinatesX(30));
    }];
    [self.scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(self.icon.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}
- (UIButton *)icon {
    if (!_icon) {
        _icon = [UIButton buttonWithType:UIButtonTypeCustom];
        _icon.backgroundColor = MediumColor;
        [self addSubview:_icon];
    }
    return _icon;
}
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] init];
        [self addSubview:_scroll];
    }
    return _scroll;
}
- (void)createSubView:(NSArray *)titles {
    for (UILabel *label in self.btns) {
        [label removeFromSuperview];
    }
    [self.btns removeAllObjects];
    
    CGFloat maxWidth = countcoordinatesX(10);
    for (int i=0; i<titles.count; i++) {
        NSString *title = titles[i];
        UIFont *font = [UIFont systemFontOfSize:adjustFont(14)];
        CGSize size = [title sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
        UIColor *color = i == 0 ? ColorTextHeavy : ColorTextBold;
        
        UILabel *btn = [[UILabel alloc] init];
        [btn setFrame:({
            CGFloat left = maxWidth;
            CGFloat top = 0;
            CGFloat width = size.width + countcoordinatesY(15);
            CGFloat height = self.height;
            CGRectMake(left, top, width, height);
        })];
        [btn setUserInteractionEnabled:YES];
        [btn setTag:i];
        [btn setTextAlignment:NSTextAlignmentCenter];
        [btn setFont:font];
        [btn setText:titles[i]];
        [btn setTextColor:color];
        [btn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            NSInteger tag = gestureRecoginzer.view.tag;
            [self show:tag time:0.2];
        }];
        [_scroll addSubview:btn];
        [_btns addObject:btn];
        maxWidth = CGRectGetMaxX(btn.frame) + countcoordinatesX(10);
    }
    [_scroll setContentSize:CGSizeMake(ScreenWidth - countcoordinatesX(40) + 1, 0)];
    [self line];
    [self show:0 time:0];
    [self setLastButton:_btns[0]];
}
- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 2, countcoordinatesX(20), 2)];
        _line.backgroundColor = [UIColor blackColor];
        _line.layer.masksToBounds = YES;
        _line.layer.cornerRadius = 1;
        [self.scroll addSubview:_line];
    }
    _line.centerX = self.btns[0].centerX;
    return _line;
}
- (NSMutableArray<UILabel *> *)btns {
    if (!_btns) {
        _btns = [[NSMutableArray alloc] init];
    }
    return _btns;
}


@end
