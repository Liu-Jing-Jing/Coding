//
//  ArticleService.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - typeof
typedef void(^SuccessHomeServiceBlock)(HomeModel *model);


#pragma mark - 声明
@interface HomeService : NSObject

+ (void)serviceRequest:(SuccessHomeServiceBlock)success error:(ErrorNetWorkBlock)error;

@end
