//
//  ContentController.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseViewController.h"
#import "ContentView.h"

//@protocol XWPresentedOneControllerDelegate <NSObject>
//
//- (void)presentedOneControllerPressedDissmiss;
//- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;
//
//@end


@interface ContentController : BaseViewController

@property (nonatomic, strong) ContentView *contentView;

@end
