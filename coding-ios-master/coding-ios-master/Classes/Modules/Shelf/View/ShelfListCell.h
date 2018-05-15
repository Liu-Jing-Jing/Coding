//
//  ShelfListCell.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseTableCell.h"

@interface ShelfListCell : BaseTableCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

+ (instancetype)initWithTable:(UITableView *)table;

@end
