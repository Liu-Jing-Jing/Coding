//
//  HomeCollectionLayout.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Protocol
@protocol HomeCollectionLayoutDelegate<NSObject>

@optional
- (void)homeCollection:(UICollectionView *)collection didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

#pragma mark - 声明
@interface HomeCollectionLayout : UICollectionViewFlowLayout<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak  ) id<HomeCollectionLayoutDelegate> delegate;
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *decorationViewAttrs;

@end
