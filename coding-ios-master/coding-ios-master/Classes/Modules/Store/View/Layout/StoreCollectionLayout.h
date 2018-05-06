//
//  StoreCollectionLayout.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Protocol
@protocol StoreCollectionLayoutDelegate<NSObject>

@optional
- (void)StoreCollection:(UICollectionView *)collection didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

#pragma mark - 声明
@interface StoreCollectionLayout : UICollectionViewFlowLayout<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak  ) id<StoreCollectionLayoutDelegate> delegate;
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *decorationViewAttrs;

@end
