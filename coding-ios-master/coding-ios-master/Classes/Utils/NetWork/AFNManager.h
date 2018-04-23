//
//  AFNManager.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - typeof
typedef void(^SuccessNetWorkBlock)(NSDictionary *data);
typedef void(^ErrorNetWorkBlock)(NSError *error);
typedef void(^ProgressNetWorkBlock)(CGFloat currentProgress, CGFloat maxProgress, CGFloat percentage);

#pragma mark - 声明
@interface AFNManager : NSObject

+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(SuccessNetWorkBlock)success error:(ErrorNetWorkBlock)error;
+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(SuccessNetWorkBlock)success error:(ErrorNetWorkBlock)error progress:(ProgressNetWorkBlock)progress;

@end
