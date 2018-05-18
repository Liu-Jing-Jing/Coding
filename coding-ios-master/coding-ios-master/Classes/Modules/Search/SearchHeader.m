//
//  SearchHeader.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SearchHeader.h"

#pragma mark - 声明
@interface SearchHeader ()<KMTagListViewDelegate>

@property (nonatomic, strong) KMTagListView *tagview;

@end

#pragma mark - 实现
@implementation SearchHeader

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    SearchHeader *view = [SearchHeader loadCode:frame];
    [view createView];
    return view;
}
- (void)createView {
    self.backgroundColor = [UIColor redColor];
    [self tagview];
}
- (KMTagListView *)tagview {
    if (!_tagview) {
        _tagview = [[KMTagListView alloc] initWithFrame:self.bounds];
        _tagview.delegate_ = self;
        [_tagview setupSubViewsWithTitles:@[@"哈哈哈哈哈哈", @"哈试发",@"哈你发",@"哈哈试会计给你发",@"哈哈你发",@"哈哈哈哈哈发", @"哈哈哈哈哈哈考试会计给你发",@"哈哈哈哈哈发",@"哈哈发",@"哈哈哈哈哈发",@"哈哈计给你发",@"哈哈哈哈哈发",@"哈哈哈发",@"哈哈哈哈哈发",@"哈哈你发",@"哈发"]];
        [self addSubview:_tagview];
        
        CGRect rect = _tagview.frame;
        rect.size.height = _tagview.contentSize.height;
        _tagview.frame = rect;
    }
    return _tagview;
}

#pragma mark - KMTagListViewDelegate
- (void)ptl_TagListView:(KMTagListView*)tagListView didSelectTagViewAtIndex:(NSInteger)index selectContent:(NSString *)content {
    NSLog(@"123");
}


@end
