//
//  BaseModel.h
//  iOS
//
//  Created by 郑业强 on 2018/4/1.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 广告
@interface AdModel : NSObject
@property (nonatomic, copy  ) NSString *image;
@property (nonatomic, copy  ) NSString *url;
@end

/// Tag
@interface TagModel : NSObject
@property (nonatomic, copy  ) NSString *ID;
@property (nonatomic, copy  ) NSString *title;
@end

/// Category
@interface CategoryModel : NSObject
@property (nonatomic, copy  ) NSString *ID;
@property (nonatomic, copy  ) NSString *name;
@end

/// 技术点
@interface TechnicalModel : NSObject
@property (nonatomic, copy  ) NSString *image;
@property (nonatomic, copy  ) NSString *name;
@end

/// 栏目
@interface ColumnModel : NSObject
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy  ) NSString *name;
@end


/// 文章
@interface EssayModel : NSObject
@property (nonatomic, copy  ) NSString *icon;   // 头像
@property (nonatomic, copy  ) NSString *name;   // 姓名
@property (nonatomic, copy  ) NSString *time;   // 时间
@property (nonatomic, strong) NSArray<CategoryModel *> *category;   // 分类
@property (nonatomic, assign) NSInteger type;   // 样式: 0 图片   1 文字
@property (nonatomic, copy  ) NSString *image;  // 图片
@property (nonatomic, copy  ) NSString *title;  // 标题
@property (nonatomic, assign) NSInteger read;   // 阅读量
@property (nonatomic, assign) NSInteger comment;    // 评论量
@property (nonatomic, assign) NSInteger like;   // 喜欢量
@end

/// BaseModel
@interface BaseModel : NSObject
@property (nonatomic, assign) NSInteger retCode;
@property (nonatomic, strong) NSString *retMessage;
@end


