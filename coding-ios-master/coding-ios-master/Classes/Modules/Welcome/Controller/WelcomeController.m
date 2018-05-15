//
//  WelcomeController.m
//  iOS
//
//  Created by 郑业强 on 2018/3/30.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "WelcomeController.h"

#pragma mark - 声明
@interface WelcomeController ()

@end

#pragma mark - 实现
@implementation WelcomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    StoreController *vc = [[StoreController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
