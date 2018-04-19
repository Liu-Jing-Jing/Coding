//
//  HomeCollectionNewsCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionHotCell.h"

#pragma mark - 声明
@interface HomeCollectionHotCell()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) WatchView *watch;

@end

#pragma mark - 实现
@implementation HomeCollectionHotCell

+ (instancetype)initWithCollection:(UICollectionView *)collection index:(NSIndexPath *)index {
    HomeCollectionHotCell *cell = [HomeCollectionHotCell loadCode:collection index:index];
    cell.backgroundColor = MediumColor;
    return cell;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

@end
