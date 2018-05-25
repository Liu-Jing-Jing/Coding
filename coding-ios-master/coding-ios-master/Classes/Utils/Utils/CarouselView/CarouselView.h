//
//  CarouselView.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "StoreModel.h"

@interface CarouselView : BaseView

@property (nonatomic, strong) NSArray *images;

+ (instancetype)initWithFrame:(CGRect)frame;

@end
