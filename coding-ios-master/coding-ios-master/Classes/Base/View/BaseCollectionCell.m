//
//  BaseCollectionCell.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseCollectionCell.h"

@implementation BaseCollectionCell

+ (instancetype)loadWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass(self);
    BaseCollectionCell *cell = [collection dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}



@end
