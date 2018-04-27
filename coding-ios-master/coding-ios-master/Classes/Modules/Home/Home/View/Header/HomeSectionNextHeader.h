//
//  HomeSectionNextHeader.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeSectionNextHeader : UICollectionReusableView

@property (nonatomic, copy  ) NSString *headerStr;

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index;

@end
