//
//  StoreCollectionSectionBgView.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionSectionBgView.h"
#import "StoreCollectionViewLayoutAttributes.h"

@implementation StoreCollectionSectionBgView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    if ([layoutAttributes isKindOfClass:[StoreCollectionViewLayoutAttributes class]]) {
        self.backgroundColor = WhiteColor;
        self.clipsToBounds = YES;
    }
}

@end
