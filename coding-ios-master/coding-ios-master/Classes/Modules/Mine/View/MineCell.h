//
//  MineCell.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/6.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseTableCell.h"

@interface MineCell : BaseTableCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIImageView *next;

+ (instancetype)initWithTable:(UITableView *)table;

@end
