//
//  HomeModel.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseModel.h"

/// 轮播图
@interface HomeAdModel : BaseModel

@property (nonatomic, copy  ) NSString *image;
@property (nonatomic, copy  ) NSString *url;

@end

/// 技术点
@interface HomeTechnicalModel : BaseModel

@property (nonatomic, copy  ) NSString *image;
@property (nonatomic, copy  ) NSString *name;

@end


/// 推荐
@interface HomeRecommendModel : BaseModel

@property (nonatomic, copy  ) NSString *objectId;
@property (nonatomic, copy  ) NSString *buildTime;
@property (nonatomic, strong) NSArray *tags;

@end


/// 首页Model
@interface HomeModel : BaseModel

/// 轮播图
@property (nonatomic, strong) NSArray<HomeAdModel *> *ad;
/// 技术点
@property (nonatomic, strong) NSArray<HomeTechnicalModel *> *technical;
/// 头条
@property (nonatomic, strong) NSArray<NSString *> *headlines;
/// 推荐
@property (nonatomic, strong) NSArray<HomeRecommendModel *> *recommend;

@end
