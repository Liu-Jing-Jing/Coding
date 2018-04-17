//
//  UIImageView+SDWebImage.h
//  iOS
//
//  Created by 郑业强 on 2018/4/5.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SDWebImageUtilsProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);
typedef void(^SDWebImageUtilsCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType);

@interface UIImageView (SDWebImage)

- (void)setImageWithUrl:(NSString *)urlStr
            placeholder:(id)placeholderStr
                options:(SDWebImageOptions)options
               progress:(SDWebImageUtilsProgressBlock)progress
             completion:(SDWebImageUtilsCompletionBlock)completion;

@end
