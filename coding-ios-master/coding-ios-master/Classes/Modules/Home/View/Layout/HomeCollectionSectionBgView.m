//
//  HomeCollectionSectionBgView.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionSectionBgView.h"
#import "HomeCollectionViewLayoutAttributes.h"

@implementation HomeCollectionSectionBgView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    if ([layoutAttributes isKindOfClass:[HomeCollectionViewLayoutAttributes class]]) {
//        self.backgroundColor = LightColor;
        self.clipsToBounds = YES;
    }
}

@end
