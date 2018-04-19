//
//  HomeCollectionLayout.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCollectionLayout.h"
#import "HomeCollectionSectionBgView.h"
#import "HomeCollectionViewLayoutAttributes.h"

@implementation HomeCollectionLayout

// 点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeCollection:didSelectItemAtIndexPath:)]) {
        [self.delegate homeCollection:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
// Cell尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenWidth / 3, ScreenWidth / 3 / 2);
    }
    else if (indexPath.section == 1) {
        CGFloat padding = countcoordinatesX(10);
        NSInteger row = 2;
        CGFloat width = (ScreenWidth - (row + 1) * padding) / row;
        CGFloat height = width / 3 * 2;
        return CGSizeMake(width, height);
    }
    else if (indexPath.section == 2) {
        CGFloat padding = countcoordinatesX(10);
        if (indexPath.row == 0) {
            CGFloat width = ScreenWidth - padding * 2;
            CGFloat height = width / 3;
            return CGSizeMake(width, height);
        } else {
            NSInteger row = 2;
            CGFloat width = (ScreenWidth - (row + 1) * padding) / row;
            CGFloat height = width / 3 * 2;
            return CGSizeMake(width, height);
        }
    }
    else if (indexPath.section == 3) {
        CGFloat width  = ScreenWidth;
        CGFloat height = width / 3;
        return CGSizeMake(width, height);
    }
    return CGSizeZero;
}
// Header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeZero;
    }
    else if (section == 1) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
    }
    else if (section == 2) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
    }
    else if (section == 3) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
    }
    return CGSizeZero;
}
// Footer
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeZero;
    }
    else if (section == 1) {
        return CGSizeMake(ScreenWidth, countcoordinatesY(40));
    }
    else if (section == 2) {
        return CGSizeZero;
    }
    else if (section == 3) {
        return CGSizeZero;
    }
    return CGSizeZero;
}
// Section内间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, countcoordinatesY(10), 0);
    }
    else if (section == 1) {
        return UIEdgeInsetsMake(countcoordinatesY(10), countcoordinatesY(10), countcoordinatesY(10), countcoordinatesY(10));
    }
    else if (section == 2) {
        return UIEdgeInsetsMake(0, countcoordinatesY(10), countcoordinatesY(10), countcoordinatesY(10));
    }
    else if (section == 3) {
        return UIEdgeInsetsMake(0, 0, countcoordinatesY(10), 0);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
// Cell间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return countcoordinatesY(10);
    }
    else if (section == 1) {
        return countcoordinatesY(10);
    }
    else if (section == 2) {
        return countcoordinatesY(10);
    }
    else if (section == 3) {
        return 0;
    }
    return 0;
}
// Section间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}



#pragma mark - 计算
- (instancetype)init {
    if (self = [super init]) {
        self.decorationViewAttrs = [NSMutableArray array];
        [self registerClass:[HomeCollectionSectionBgView class] forDecorationViewOfKind:@"HomeCollectionSectionBgView"];
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
    
    for (UICollectionViewLayoutAttributes *attr in array) {
        if (attr.indexPath.row == 2 && attr.indexPath.section == 2) {
            CGRect frame = attr.frame;
            frame.origin.x += countcoordinatesX(10);
            attr.frame = frame;
        }
        else if ([attr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader] &&
                 attr.indexPath.section == 2) {
            CGRect frame = attr.frame;
            frame.origin.y += countcoordinatesY(10);
            attr.frame = frame;
        }
    }
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
        HomeCollectionViewLayoutAttributes *attr = [HomeCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"HomeCollectionSectionBgView" withIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        attr.frame = sectionFrame;
        attr.zIndex = -1;
        attr.section = section;
        [self.decorationViewAttrs addObject:attr];
    }
}
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if ([elementKind isEqualToString:@"HomeCollectionSectionBgView"]) {
        return [self.decorationViewAttrs objectAtIndex:indexPath.section];
    }
    return [super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];
}

@end
