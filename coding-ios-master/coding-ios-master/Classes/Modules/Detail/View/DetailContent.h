//
//  DetailContent.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

@interface DetailContent : BaseView

// 图标
@property (weak, nonatomic) IBOutlet UIImageView *icon;

+ (instancetype)initWithFrame:(CGRect)frame;
- (void)shadowAlphaWithContentOffsetY:(CGFloat)y;

@end
