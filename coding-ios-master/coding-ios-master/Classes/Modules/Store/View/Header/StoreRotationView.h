//
//  StoreRotationView.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "StoreModel.h"

/// 顶部轮播图
@interface StoreRotationView : BaseView

@property (nonatomic, strong) NSArray<StoreSubModel *> *images;

+ (instancetype)initWithFrame:(CGRect)frame;

@end
