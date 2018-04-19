//
//  HomeController.m
//  iOS
//
//  Created by 郑业强 on 2018/4/1.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "HomeController.h"
#import "HomeView.h"
#import "ItemTransition.h"

#pragma mark - 声明
@interface HomeController ()<HomeViewDelegate>

@property (nonatomic, strong) HomeView *homeView;

@end

#pragma mark - 实现
@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"首页"];
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
- (void)homeCollection:(UICollectionView *)collection didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _currentItem = [collection cellForItemAtIndexPath:indexPath];
    
    ContentController *vc = [[ContentController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
}


#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    // 这里我们初始化presentType
    return [ItemTransition transitionWithTransitionType:ItemTransitionTypePresent];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    // 这里我们初始化dismissType
    return [ItemTransition transitionWithTransitionType:ItemTransitionTypeDismiss];
}



@end
