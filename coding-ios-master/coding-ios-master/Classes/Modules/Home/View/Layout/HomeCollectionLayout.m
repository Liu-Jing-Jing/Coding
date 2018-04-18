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

+ (instancetype)init {
    HomeCollectionLayout *layout = [[HomeCollectionLayout alloc] init];
    [layout registerClass:[HomeCollectionSectionBgView class] forDecorationViewOfKind:@"HomeCollectionSectionBgView"];
    return layout;
}
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
