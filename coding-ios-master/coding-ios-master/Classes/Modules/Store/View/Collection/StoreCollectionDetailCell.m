//
//  StoreCollectionDetailCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionDetailCell.h"

#pragma mark - 声明
@interface StoreCollectionDetailCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraintT;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentConstraintR;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UIView *scoreV;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UIView *categoryV;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

#pragma mark - 实现
@implementation StoreCollectionDetailCell

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    StoreCollectionDetailCell *cell = [StoreCollectionDetailCell loadWithCollection:collection indexPath:indexPath];
    [cell createLayout];
    return cell;
}
- (void)createLayout {
    _iconConstraintL.constant = countcoordinatesX(15);
    _iconConstraintT.constant = countcoordinatesX(10);
    _nameConstraintL.constant = countcoordinatesX(10);
    _contentConstraintR.constant  = countcoordinatesX(15);
    _name.font = [UIFont boldSystemFontOfSize:adjustFont(14)];
    _name.textColor = ColorTextBold;
    _desc.font = [UIFont systemFontOfSize:adjustFont(10)];
    _desc.textColor = ColorTextMedium;
    _author.font = [UIFont systemFontOfSize:adjustFont(12)];
    _author.textColor = ColorTextMedium;
    _score.font = [UIFont systemFontOfSize:adjustFont(9)];
    _score.textColor = ColorTextMedium;
    _scoreV.layer.cornerRadius = 3;
    _scoreV.layer.masksToBounds = YES;
    _scoreV.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    _scoreV.layer.borderColor = ColorTextMedium.CGColor;
    _category.font = [UIFont systemFontOfSize:adjustFont(9)];
    _category.textColor = ColorTextMedium;
    _categoryV.layer.cornerRadius = 3;
    _categoryV.layer.masksToBounds = YES;
    _categoryV.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    _categoryV.layer.borderColor = ColorTextMedium.CGColor;
    _line.backgroundColor = ColorBg;
    
    _desc.attributedText = [NSAttributedString attributedWithLineSpacing:5 color:ColorTextMedium font:[UIFont systemFontOfSize:adjustFont(10)] str:@"[已完结]: 埃里克森道具卡和大家都说不记得哈苏肯德基奥斯卡的痕迹爱上第六届奥斯卡的金卡和实地加拉斯柯达不舍得卡时间段"];
    
}

@end
