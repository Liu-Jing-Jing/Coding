//
//  ArticleCollectionIconCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleCollectionIconCell.h"

#pragma mark - 声明
@interface ArticleCollectionIconCell ()
@property (weak, nonatomic) IBOutlet UIButton *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *sort;
@property (weak, nonatomic) IBOutlet UIImageView *eye;
@property (weak, nonatomic) IBOutlet UILabel *number;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconWH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameX;

@end

#pragma mark - 实现
@implementation ArticleCollectionIconCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    ArticleCollectionIconCell *cell = [ArticleCollectionIconCell loadCode:collection index:index];
    [cell createLayout];
    return cell;
}
- (void)createLayout {
    _iconX.constant = countcoordinatesX(10);
    _iconWH.constant = countcoordinatesX(40);
    _nameX.constant = countcoordinatesX(5);
    [_name titleFontAndColor];
    [_category descFontAndColor];
    [_time descFontAndColor];
}

- (void)setModel:(EssayModel *)model {
    _model = model;
    [_image setWithImageURL:model.image options:SDWebImageDownloaderLowPriority progress:nil completion:nil];
}

@end









