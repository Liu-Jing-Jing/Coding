//
//  ArticleCollectionNameCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/25.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ArticleCollectionNameCell.h"

#pragma mark - 声明
@interface ArticleCollectionNameCell ()

@property (weak, nonatomic) IBOutlet UIButton *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconWH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameX;

@end

#pragma mark - 实现
@implementation ArticleCollectionNameCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    ArticleCollectionNameCell *view = [collection dequeueReusableCellWithReuseIdentifier:@"ArticleCollectionNameCell" forIndexPath:index];
    return view;
}
- (void)setModel:(EssayModel *)model {
    _model = model;
    _iconX.constant = countcoordinatesX(10);
    _iconWH.constant = countcoordinatesX(40);
    _nameX.constant = countcoordinatesX(5);
    [_icon xw_roundedCornerWithRadius:_image.height / 2 cornerColor:[UIColor whiteColor]];
    [_name titleFontAndColor];
    [_name setText:model.name];
    [_category descFontAndColor];
    [_time descFontAndColor];
    [_title changeFont:[UIFont systemFontOfSize:adjustFont(14)] color:ColorTextBold];
    [_title setText:model.title];
    [_desc changeFont:[UIFont systemFontOfSize:adjustFont(10)] color:ColorTextLight];
    [_image setWithImageURL:model.image options:SDWebImageDownloaderLowPriority progress:nil completion:nil];
}


@end
