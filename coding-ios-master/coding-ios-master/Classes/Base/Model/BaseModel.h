//
//  BaseModel.h
//  iOS
//
//  Created by 郑业强 on 2018/4/1.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import <Foundation/Foundation.h>

/// BaseModel
@interface BaseModel : NSObject

@property (nonatomic, assign) NSInteger retCode;
@property (nonatomic, strong) NSString *retMessage;

@end


/// Tag
@interface TagModel : BaseModel
@property (nonatomic, copy  ) NSString *ID;
@property (nonatomic, copy  ) NSString *title;
@end


/// Category
@interface CategoryModel : BaseModel
@property (nonatomic, copy  ) NSString *ID;
@property (nonatomic, copy  ) NSString *name;
@end


/// 技术点
@interface TechnicalModel : BaseModel
@property (nonatomic, copy  ) NSString *image;
@property (nonatomic, copy  ) NSString *name;
@end
