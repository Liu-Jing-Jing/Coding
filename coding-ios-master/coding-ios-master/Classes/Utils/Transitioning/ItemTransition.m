//
//  ItemTransition.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ItemTransition.h"
#import "HomeCollectionOtherCell.h"
#import "HomeCollectionCategoryCell.h"

#pragma mark - 声明
@interface ItemTransition ()

@property (nonatomic, assign) ItemTransitionType type;

@end

#pragma mark - 实现
@implementation ItemTransition

+ (instancetype)transitionWithTransitionType:(ItemTransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(ItemTransitionType)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

// 动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}
// 所有的过渡动画事务都在这个方法里面完成
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 为了将两种动画的逻辑分开，变得更加清晰，我们分开书写逻辑，
    switch (_type) {
        case ItemTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
            
        case ItemTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
    }
}
// 实现present动画逻辑代码
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    BaseTabBarController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    HomeController *homeVC = [(BaseNavigationController *)fromVC.viewControllers[0] viewControllers][0];
    HomeCollectionCategoryCell *cell = (HomeCollectionCategoryCell *)homeVC.currentItem;
    ContentController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [cell convertRect:homeVC.currentItem.bounds toView:window];
    
    UIView *item = [cell.icon snapshotViewAfterScreenUpdates:NO];
    cell.eyeBg.alpha = 1;
    item.frame = rect;
    item.backgroundColor = [UIColor redColor];
    homeVC.currentItem.hidden = YES;
    toVC.view.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
    toVC.view.alpha = 1;
    // 存放转场控件
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView addSubview:item];
    
    
    
    __block NSInteger count = 0;
    void (^completion)(void) = ^() {
        if (count == 3) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            // 转场失败
            if ([transitionContext transitionWasCancelled]) {
                homeVC.currentItem.hidden = NO;
                [item removeFromSuperview];
            }
            // 转场成功
            else {
                homeVC.currentItem.hidden = NO;
                [toVC transitionDidFinish];
                [item removeFromSuperview];
            }
        }
    };
    POPSpringAnimation *alpha1 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    [alpha1 setToValue:[NSValue valueWithCGRect:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2)]];
    [alpha1 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        count += 1;
        completion();
    }];
    [item pop_addAnimation:alpha1 forKey:@"size"];
    
    POPSpringAnimation *anim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    [anim1 setToValue:[NSValue valueWithCGRect:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2)]];
    [anim1 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        count += 1;
        completion();
    }];
    [item pop_addAnimation:anim1 forKey:@"size"];
    
    POPSpringAnimation *anim2 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    [anim2 setToValue:[NSValue valueWithCGRect:CGRectMake(0, ScreenWidth / 2, ScreenWidth, ScreenHeight)]];
    [anim2 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        toVC.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        count += 1;
        completion();
    }];
    [toVC.view pop_addAnimation:anim2 forKey:@"size"];
    
    
}
// 实现dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    ContentController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BaseTabBarController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    HomeController *homeVC = [(BaseNavigationController *)toVC.viewControllers[0] viewControllers][0];
    HomeCollectionCategoryCell *cell = (HomeCollectionCategoryCell *)homeVC.currentItem;
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [cell convertRect:homeVC.currentItem.bounds toView:window];
    UIView *item = [fromVC.contentView.icon snapshotViewAfterScreenUpdates:NO];
    item.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth / 2);
    item.backgroundColor = [UIColor redColor];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:item];
    [containerView bringSubviewToFront:item];
    
    [fromVC transitionDidDisappear];
    [fromVC.view setFrame:CGRectMake(0, ScreenWidth / 2, ScreenWidth, ScreenHeight)];
    
    
    __block NSInteger count = 0;
    void (^completion)(void) = ^() {
        if (count == 2) {
            // 转场失败
            if ([transitionContext transitionWasCancelled]) {
                [transitionContext completeTransition:NO];
            }
            // 转场成功
            else {
                [transitionContext completeTransition:YES];
                toVC.view.hidden = NO;
                [item removeFromSuperview];
            }
        }
    };
    POPSpringAnimation *anim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    [anim1 setToValue:[NSValue valueWithCGRect:CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight)]];
    [anim1 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        count += 1;
        completion();
    }];
    [fromVC.view pop_addAnimation:anim1 forKey:@"anim1"];
    
    POPSpringAnimation *anim2 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    [anim2 setToValue:[NSValue valueWithCGRect:rect]];
    [anim2 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        count += 1;
        completion();
    }];
    [item pop_addAnimation:anim2 forKey:@"anim1"];
    
}

@end
