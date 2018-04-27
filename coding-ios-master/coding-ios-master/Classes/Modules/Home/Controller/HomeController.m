//
//  HomeController.m
//  iOS
//
//  Created by 郑业强 on 2018/4/1.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "HomeController.h"
#import "HomeView.h"

#pragma mark - 声明
@interface HomeController ()<HomeViewDelegate>

@property (nonatomic, strong) HomeView *homeView;

@end

#pragma mark - 实现
@implementation HomeController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"首页"];
    [self setJz_wantsNavigationBarVisible:YES];
    [self setJz_navigationBarTintColor:[UIColor whiteColor]];
}
- (void)loadView {
    self.view = [self homeView];
}
- (HomeView *)homeView {
    if (!_homeView) {
        _homeView = [HomeView init];
        _homeView.delegate = self;
    }
    return _homeView;
}

#pragma mark - HomeViewDelegate
// 点击了Item
- (void)homeCollection:(UICollectionView *)collection didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _currentItem = [collection cellForItemAtIndexPath:indexPath];
    
    ContentController *vc = [[ContentController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}





@end
