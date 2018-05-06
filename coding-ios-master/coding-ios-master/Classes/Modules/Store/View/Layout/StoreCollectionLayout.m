//
//  StoreCollectionLayout.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "StoreCollectionLayout.h"
#import "StoreCollectionSectionBgView.h"
#import "StoreCollectionViewLayoutAttributes.h"

@implementation StoreCollectionLayout

// 点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(StoreCollection:didSelectItemAtIndexPath:)]) {
        [self.delegate StoreCollection:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

//#pragma mark - UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0) {
//        CGFloat row = 3;
//        CGFloat width = (ScreenWidth - countcoordinatesX(15) * (row + 1)) / row;
//        return CGSizeMake(width, width / 3 * 5);
//    }
//    else if (indexPath.section == 1) {
//        CGFloat row = 2;
//        CGFloat width = (ScreenWidth - countcoordinatesX(15) * (row + 1)) / row;
//        return CGSizeMake(width, width / 4 * 3);
//    }
//    else if (indexPath.section == 2) {
//        CGFloat width = ScreenWidth;
//        return CGSizeMake(width, width / 3);
//    }
//    return CGSizeZero;
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    return CGSizeMake(ScreenWidth, 40);
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    return CGSizeMake(ScreenWidth, FooterHeight);
//}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    if (section == 0) {
//        return UIEdgeInsetsMake(0, countcoordinatesX(15), 0, countcoordinatesX(15));
//    }
//    else if (section == 1) {
//        return UIEdgeInsetsMake(0, countcoordinatesX(15), 0, countcoordinatesX(15));
//    }
//    else if (section == 2) {
//        return UIEdgeInsetsZero;
//    }
//    return UIEdgeInsetsZero;
//}

#pragma mark - 计算
- (instancetype)init {
    if (self = [super init]) {
        self.decorationViewAttrs = [NSMutableArray array];
        [self registerClass:[StoreCollectionSectionBgView class] forDecorationViewOfKind:@"StoreCollectionSectionBgView"];
    }
    return self;
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *array = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for (UICollectionViewLayoutAttributes *attr in self.decorationViewAttrs) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [array addObject:attr];
        }
    }
    
//    for (UICollectionViewLayoutAttributes *attr in array) {
//        if (attr.indexPath.row == 2 && attr.indexPath.section == 2) {
//            CGRect frame = attr.frame;
////            frame.origin.x += countcoordinatesX(10);
//            attr.frame = frame;
//        }
//        else if ([attr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader] &&
//                 attr.indexPath.section == 2) {
//            CGRect frame = attr.frame;
////            frame.origin.y += countcoordinatesY(10);
//            attr.frame = frame;
//        }
//    }
    return array;
}
- (void)prepareLayout {
    [super prepareLayout];
    [self.decorationViewAttrs removeAllObjects];
    
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    id delegate = self.collectionView.delegate;
    if (!numberOfSections) {
        return;
    }
    
    for (NSInteger section = 0; section < numberOfSections; section++) {
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        if (numberOfItems <= 0) {
            continue;
        }
        UICollectionViewLayoutAttributes *firstItem = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        UICollectionViewLayoutAttributes *lastItem = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:numberOfItems - 1 inSection:section]];
        if (!firstItem || !lastItem) {
            continue;
        }
        
        UIEdgeInsets sectionInset = [self sectionInset];
        
        if ([delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
            UIEdgeInsets inset = [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
            sectionInset = inset;
        }
        
        
        CGRect sectionFrame = CGRectUnion(firstItem.frame, lastItem.frame);
        sectionFrame.origin.x -= sectionInset.left;
        sectionFrame.origin.y -= sectionInset.top;
        
        if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
            sectionFrame.size.width += sectionInset.left + sectionInset.right;
            sectionFrame.size.height = self.collectionView.frame.size.height;
        } else {
            sectionFrame.size.width = self.collectionView.frame.size.width;
            sectionFrame.size.height += sectionInset.top + sectionInset.bottom;
        }
        
        // 2、定义
        StoreCollectionViewLayoutAttributes *attr = [StoreCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"StoreCollectionSectionBgView" withIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        attr.frame = sectionFrame;
        attr.zIndex = -1;
        attr.section = section;
        [self.decorationViewAttrs addObject:attr];
    }
}
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if ([elementKind isEqualToString:@"StoreCollectionSectionBgView"]) {
        return [self.decorationViewAttrs objectAtIndex:indexPath.section];
    }
    return [super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];
}

@end
