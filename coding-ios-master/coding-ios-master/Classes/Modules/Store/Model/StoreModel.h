//
//  StoreModel.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseModel.h"

@interface StoreSubModel : NSObject

@property (nonatomic, copy  ) NSString *icon_big;
@property (nonatomic, copy  ) NSString *icon_lrc;
@property (nonatomic, copy  ) NSString *icon_small;
@property (nonatomic, copy  ) NSString *name;
@property (nonatomic, copy  ) NSString *songid;
@property (nonatomic, assign) NSInteger type;

@end


@interface StoreModel : BaseModel

// id
@property (nonatomic, assign) NSInteger lid;
// 轮播图
@property (nonatomic, strong) NSArray<StoreSubModel *> *rotation;
// 推荐歌单
@property (nonatomic, strong) NSArray<StoreSubModel *> *recommend;
// 独家放送
@property (nonatomic, strong) NSArray<StoreSubModel *> *exclusive;
// 精选专栏
@property (nonatomic, strong) NSArray<StoreSubModel *> *featured;

@end
