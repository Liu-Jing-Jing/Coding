//
//  BaseViewController.m
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "BaseViewController.h"

#pragma mark - 声明
@interface BaseViewController ()

@end

#pragma mark - 实现
@implementation BaseViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    _allowPanBack = YES;
    self.navigationController.jz_navigationBarTransitionStyle = JZNavigationBarTransitionStyleSystem;
    self.navigationController.jz_navigationBarSize = CGSizeMake(ScreenWidth, 100);
}
- (void)setNavTitle:(NSString *)navTitle {
    _navTitle = navTitle;
    NSInteger fontSize = 14;
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:fontSize];
    CGSize maxSize = [navTitle sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
    UIButton *btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = font;
        [btn setFrame:CGRectMake(0, 0, maxSize.width, 40)];
        [btn setTitleColor:MediumColor forState:UIControlStateNormal];
        [btn setTitle:navTitle forState:UIControlStateNormal];
        btn;
    });
    self.navigationItem.titleView = btn;
}


- (void)setLeftClick:(NSArray<NSArray *> *)datas {
    NSMutableArray<UIBarButtonItem *> *items = [[NSMutableArray alloc] init];
    for (int i=0; i<datas.count; i++) {
        NSString *image = datas[i][0];
        NSString *title = datas[i][1];
        UIFont  *font   = [UIFont systemFontOfSize:14];
        CGSize  titleSize = [title sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
        CGSize  imageSize = image.length == 0 ? CGSizeMake(0, 20) : CGSizeMake(20, 20);
        CGFloat padding   = 3;
        
        YLButton *btn = ({
            YLButton *btn = [YLButton buttonWithType:UIButtonTypeCustom];
            [btn setTag:i];
            if (image && image.length != 0) {
                [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            }
            [btn setTitle:title forState:UIControlStateNormal];
            [btn.titleLabel setFont:font];
            [btn setTitleColor:MediumColor forState:UIControlStateNormal];
            [btn setImageRect:CGRectMake(0, (44 - imageSize.height) / 2, imageSize.width, imageSize.height)];
            [btn setTitleRect:CGRectMake(imageSize.width + padding, 0, titleSize.width, 44)];
            btn;
        });
        
        UIView *view = ({
            UIView *view = [[UIView alloc] init];
            [view setTag:i];
            [view setFrame:CGRectMake(0, 0, imageSize.width + titleSize.width + padding, 44)];
            [view addSubview:btn];
            view;
        });
        
        UIBarButtonItem *item = ({
            UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(leftBtnPressed:)];
            tap.minimumPressDuration = 0.1f;
            [view addGestureRecognizer:tap];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
            item;
        });
        [items addObject:item];
    }
    [self.navigationItem setLeftBarButtonItems:items];
}
- (void)leftBtnPressed:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    [self leftItemPressed:view.tag];
}
- (void)leftItemPressed:(NSInteger)index {
    NSLog(@"left");
}


- (void)setRightClick:(NSArray<NSArray *> *)datas {
    NSMutableArray<UIBarButtonItem *> *items = [[NSMutableArray alloc] init];
    for (int i=0; i<datas.count; i++) {
        NSString *image = datas[i][0];
        NSString *title = datas[i][1];
        UIFont *font = [UIFont systemFontOfSize:14];
        CGSize titleSize = [title sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
        CGSize imageSize = image.length == 0 ? CGSizeMake(0, 20) : CGSizeMake(20, 20);
        CGFloat padding = 3;
        
        YLButton *btn = ({
            YLButton *btn = [YLButton buttonWithType:UIButtonTypeCustom];
            [btn setTag:i];
            if (image && image.length != 0) {
                [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            }
            [btn setTitle:title forState:UIControlStateNormal];
            [btn.titleLabel setFont:font];
            [btn setTitleColor:MediumColor forState:UIControlStateNormal];
            [btn setImageRect:CGRectMake(0, (44 - imageSize.height) / 2, imageSize.width, imageSize.height)];
            [btn setTitleRect:CGRectMake(imageSize.width + padding, 0, titleSize.width, 44)];
            btn;
        });
        
        UIView *view = ({
            UIView *view = [[UIView alloc] init];
            [view setTag:i];
            [view setFrame:CGRectMake(0, 0, imageSize.width + titleSize.width + padding, 44)];
            [view addSubview:btn];
            view;
        });
        
        UIBarButtonItem *item = ({
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightBtnPressed:)];
            [view addGestureRecognizer:tap];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
            item;
        });
        [items addObject:item];
    }
    
    
    
    
    [self.navigationItem setRightBarButtonItems:items];
}
- (void)rightBtnPressed:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    [self rightItemPressed:view.tag];
}
- (void)rightItemPressed:(NSInteger)index {
    NSLog(@"right");
}


- (void)setAllowPanBack:(BOOL)allowPanBack {
    _allowPanBack = allowPanBack;
}


- (instancetype)init {
    if (self = [super init]) {
        if ([self isKindOfClass:[HomeController class]]) {
            self.hidesBottomBarWhenPushed = NO;
        } else {
            self.hidesBottomBarWhenPushed = YES;
        }
    }
    return self;
}


@end

