//
//  MJRefreshBackFooter+Extension.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MJRefreshAutoNormalFooter+Extension.h"

@implementation MJRefreshAutoNormalFooter (Extension)

+ (MJRefreshAutoNormalFooter *)footerWithNormalRefreshing:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshingBlock];
    footer.refreshingTitleHidden = YES;
    return footer;
}

@end
