//
//  UIImageView+SDWebImage.m
//  iOS
//
//  Created by 郑业强 on 2018/4/5.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "UIImageView+SDWebImage.h"

@implementation UIImageView (SDWebImage)

- (void)setImageWithUrl:(NSString *)urlStr
            placeholder:(id)placeholderStr
                options:(SDWebImageOptions)options
               progress:(SDWebImageUtilsProgressBlock)progress
             completion:(SDWebImageUtilsCompletionBlock)completion {
    NSURL *url = [NSURL URLWithString:urlStr];
    UIImage *placeholder;
    if ([placeholderStr isKindOfClass:[NSString class]]) {
        placeholder = [UIImage imageNamed:placeholderStr];
    } else if ([placeholderStr isKindOfClass:[UIImage class]]) {
        placeholder = placeholderStr;
    }
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        if (progress) {
            progress(receivedSize, expectedSize);
        }
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (completion) {
            completion(image, error, cacheType);
        }
    }];
}

@end
