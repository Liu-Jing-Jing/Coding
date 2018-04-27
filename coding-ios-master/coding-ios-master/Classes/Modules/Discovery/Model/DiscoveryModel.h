//
//  DiscoveryModel.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/26.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

// 推荐
@interface DiscoveryRecommendModel : NSObject

@property (nonatomic, copy  ) NSString *icon;   // 图标
@property (nonatomic, copy  ) NSString *name;   // 描述
@property (nonatomic, copy  ) NSString *humen;  // 人数
@property (nonatomic, copy  ) NSString *topic;  // 话题数
@property (nonatomic, copy  ) NSString *image;  // 图片

@end


@interface DiscoveryModel : BaseModel

@property (nonatomic, strong) NSArray<AdModel *> *ad;                           // 广告
@property (nonatomic, strong) NSArray<NSString *> *hot;                         // 话题图片
@property (nonatomic, strong) NSArray<DiscoveryRecommendModel *> *recommend;    // 推荐
@property (nonatomic, strong) NSArray<NSString *> *theme;                       // 主题
@property (nonatomic, strong) NSArray<EssayModel *> *article;                 // 专题
@property (nonatomic, strong) NSArray<NSString *> *sectionHeader;               // 专题精选

@end
