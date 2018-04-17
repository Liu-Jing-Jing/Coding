//
//  UIFont+Extension.h
//  iOS
//
//  Created by RY on 2018/3/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)

/// 自适应字体大小
+ (CGFloat)adjustFontSize:(CGFloat)fontsize;

+ (UIFont *)adjustFont:(UIFont *)font;

@end
