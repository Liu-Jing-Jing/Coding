//
//  ScreenMarcros.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenSize   [UIScreen mainScreen].bounds.size
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenScale  [UIScreen mainScreen].scale

#define iPhoneX                 (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)
#define StatusBarHeight         (iPhoneX ? 44.f : 20.f)
#define NavigationBarHeight     (44.f + StatusBarHeight)
#define SafeAreaBottomHeight    (iPhoneX ? 34 : 0)
#define TabbarHeight            (iPhoneX ? (49.f + SafeAreaBottomHeight) : 49.f)

#define countcoordinatesX(A) ScreenWidth * (A / 320.f)
#define countcoordinatesY(A) ScreenHeight * (A / 568.f)


