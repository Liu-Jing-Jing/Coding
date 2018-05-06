//
//  MineCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/6.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineCell.h"

#pragma mark - 声明
@interface MineCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIImageView *next;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextConstraintR;

@end

#pragma mark - 实现
@implementation MineCell

+ (instancetype)initWithTable:(UITableView *)table {
    MineCell *cell = [MineCell loadFirstNib:table];
    [cell createView];
    return cell;
}
- (void)createView {
    _name.textColor = ColorTextBold;
    _desc.textColor = ColorTextMedium;
    _name.font = [UIFont systemFontOfSize:adjustFont(12)];
    _desc.font = [UIFont systemFontOfSize:adjustFont(12)];
    _iconConstraintL.constant = countcoordinatesX(15);
    _nameConstraintL.constant = countcoordinatesX(10);
    _nextConstraintR.constant = countcoordinatesX(15);
    _nextConstraintL.constant = countcoordinatesX(10);
}

@end
