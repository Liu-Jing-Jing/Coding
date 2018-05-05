//
//  StoreCollectionSectionHeader.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/5/5.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseCollectionReusableView.h"

@interface StoreCollectionSectionHeader : BaseCollectionReusableView

@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

+ (instancetype)initWithCollection:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath;
- (void)show;
- (void)hide;

@end
