//
//  SearchView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SearchView.h"
#import "SearchCell.h"
#import "SearchHeader.h"
#import "SearchSectionHeader.h"

#pragma mark - 声明
@interface SearchView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) SearchHeader *header;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, weak  ) UIView *inView;

@end

#pragma mark - 实现
@implementation SearchView

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame inView:(UIView *)inView {
    SearchView *view = [SearchView loadCode:frame];
    [view setInView:inView];
    [view createView];
    return view;
}
- (void)createView {
    [self header];
    [self table];
}
- (SearchHeader *)header {
    if (!_header) {
        _header = [SearchHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    }
    return _header;
}
- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:self.bounds];
        _table.delegate = self;
        _table.dataSource = self;
        _table.tableHeaderView = [self header];
        [self addSubview:_table];
    }
    return _table;
}

#pragma mark - 动画
- (void)show {
    __weak typeof(self) weak = self;
    self.alpha = 0;
    [_inView addSubview:self];
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [weak setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide {
    __weak typeof(self) weak = self;
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [weak setAlpha:0];
    } completion:^(BOOL finished) {
        [weak removeFromSuperview];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchCell *cell = [SearchCell initWithTable:tableView index:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SearchSectionHeader *view = [SearchSectionHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeight = 50;
    if (scrollView == _table) {
        if (_table.contentOffset.y <= sectionHeight && _table.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else {
            if (_table.contentOffset.y >= sectionHeight) {
                scrollView.contentInset = UIEdgeInsetsMake(-sectionHeight, 0, 0, 0);
            }
        }
    }
}


@end
