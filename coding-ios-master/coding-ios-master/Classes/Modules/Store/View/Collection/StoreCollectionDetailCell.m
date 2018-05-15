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

@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *read;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *readConstraintL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *readConstraintB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *categoryConstraintT;

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
    _readConstraintL.constant = countcoordinatesX(15);
    _categoryConstraintT.constant = countcoordinatesY(15);
    _readConstraintB.constant = countcoordinatesY(15);
    _content.attributedText = ({
        NSString *_test  =  @"首行缩进根据字体大小自动调整 间隔可自定根据需求随意改变。。。。。。。" ;
        NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
        paraStyle01.alignment = NSTextAlignmentLeft;  // 对齐
        paraStyle01.headIndent = 0.0f;      // 行首缩进
        CGFloat emptylen = 80;
        paraStyle01.firstLineHeadIndent = emptylen; // 首行缩进
        paraStyle01.tailIndent = 0.0f;  // 行尾缩进
        paraStyle01.lineSpacing = 2.0f; // 行间距
        
        NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:_test attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
        attrText;
    });
}

@end
