//
//  ArticleController.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleController.h"
#import "ArticleView.h"
#import "ArticleModel.h"

#pragma mark - 声明
@interface ArticleController ()

@property (nonatomic, strong) ArticleView *articleView;
@property (nonatomic, strong) ArticleModel *model;

@end

#pragma mark - 实现
@implementation ArticleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"文章"];
    [self getArticleList];
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

#pragma mark - 请求
- (void)getArticleList {
    [AFNManager GET:[NSString getArticleList] params:nil success:^(NSDictionary *data) {
        ArticleModel *model = [ArticleModel mj_objectWithKeyValues:data];
        _articleView.model = model;
//        [_homeView setModel:model];
//        [_homeView endHeaderRefreshing];
//        [_homeView endFooterRefreshing];
    } error:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}


@end
