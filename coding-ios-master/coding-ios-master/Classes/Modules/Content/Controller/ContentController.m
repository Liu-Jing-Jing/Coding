//
//  ContentController.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ContentController.h"
#import "ItemTransition.h"
#import "KKPercentDrivenInteractiveTransition.h"

#pragma mark - 声明
@interface ContentController ()<UIViewControllerTransitioningDelegate>

@end

#pragma mark - 实现
@implementation ContentController

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)loadView {
    self.view = [self contentView];
}
- (ContentView *)contentView {
    if (!_contentView) {
        _contentView = [ContentView init];
    }
    return _contentView;
}

- (void)transitionDidFinish {
    [_contentView transitionDidAppear];
}
- (void)transitionDidDisappear {
    [_contentView transitionDidDisappear];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [ItemTransition transitionWithTransitionType:ItemTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [ItemTransition transitionWithTransitionType:ItemTransitionTypeDismiss];
}




@end
