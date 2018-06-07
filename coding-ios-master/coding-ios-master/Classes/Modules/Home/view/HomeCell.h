//
//  HomeCell.h
//  coding-ios-master
//
//  Created by MAC on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseCollectionCell.h"
#import "HomeShapeView.h"

#pragma mark - 声明
@interface HomeCell : BaseCollectionCell

/// 过程
@property (nonatomic, assign) CGFloat progress;
/// 状态
@property (nonatomic, assign) HomeShapeStatus status;
/// 背景颜色
@property (nonatomic, strong) UIColor *bgColor;
/// 圆圈颜色
@property (nonatomic, strong) UIColor *shapeColor;

@end
