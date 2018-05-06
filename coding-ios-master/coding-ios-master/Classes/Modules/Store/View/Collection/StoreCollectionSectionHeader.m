//
//  StoreCollectionSectionHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionSectionHeader.h"

#pragma mark - 声明
@interface StoreCollectionSectionHeader()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraintR;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelConstrainL;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *moreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moreIcon;

@end

#pragma mark - 实现
@implementation StoreCollectionSectionHeader

#pragma mark - 初始化
+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    StoreCollectionSectionHeader *header = [super initWithCollection:collection kind:UICollectionElementKindSectionHeader indexPath:indexPath];
    [header createLayout];
    return header;
}
- (void)createLayout {
    _iconConstraintR.constant = countcoordinatesX(10);
    _labelConstrainL.constant = countcoordinatesX(15);
    _name.textColor = ColorTextBold;
    _name.font = [UIFont systemFontOfSize:adjustFont(12)];
    _moreLabel.textColor = ColorTextMedium;
    _moreLabel.font = [UIFont systemFontOfSize:adjustFont(12)];
}

#pragma mark - 动画
- (void)show {
    _moreLabel.hidden = NO;
    _moreIcon.hidden = NO;
    _moreBtn.hidden = NO;
}
- (void)hide {
    _moreLabel.hidden = YES;
    _moreIcon.hidden = YES;
    _moreBtn.hidden = YES;
}


@end
