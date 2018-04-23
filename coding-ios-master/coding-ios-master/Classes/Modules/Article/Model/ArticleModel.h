//
//  ArticleModel.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseModel.h"

/// 广告
@interface ArticleAdModel : BaseModel

@property (nonatomic, copy  ) NSString *image;
@property (nonatomic, copy  ) NSString *url;

@end

/// 文章
@interface ArticleArticleModel : BaseModel

@property (nonatomic, copy  ) NSString *icon;
@property (nonatomic, copy  ) NSString *name;
@property (nonatomic, copy  ) NSString *time;
@property (nonatomic, strong) NSArray<CategoryModel *> *category;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy  ) NSString *image;
@property (nonatomic, assign) NSInteger read;
@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger like;

@end

/// 数据
@interface ArticleModel : BaseModel

@property (nonatomic, strong) NSArray<ArticleAdModel *> *ad;
@property (nonatomic, strong) NSArray<TechnicalModel *> *technical;
@property (nonatomic, strong) NSArray<ArticleArticleModel *> *article;

@end
