//
//  ArticleController.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleController.h"
#import "ArticleView.h"

#pragma mark - 声明
@interface ArticleController ()

@property (nonatomic, strong) ArticleView *articleView;

@end

#pragma mark - 实现
@implementation ArticleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"文章"];
}
- (void)loadView {
    self.view = [self articleView];
}
- (ArticleView *)articleView {
    if (!_articleView) {
        _articleView = [ArticleView init];
    }
    return _articleView;
}


@end
