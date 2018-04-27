//
//  ArticleModel.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseModel.h"

/// 数据
@interface ArticleModel : BaseModel

@property (nonatomic, strong) NSArray<AdModel *> *ad;
@property (nonatomic, strong) NSArray<TechnicalModel *> *technical;
@property (nonatomic, strong) NSArray<EssayModel *> *article;

@end
