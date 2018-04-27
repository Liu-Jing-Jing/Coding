//
//  DiscoveryService.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - typeof
typedef void(^SuccessDiscoveryServiceBlock)(DiscoveryModel *model);

#pragma mark - 声明
@interface DiscoveryService : NSObject

+ (void)serviceRequestWithPage:(NSInteger)page success:(SuccessDiscoveryServiceBlock)success error:(ErrorNetWorkBlock)error;

@end
