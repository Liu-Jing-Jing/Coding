//
//  DiscoveryView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MineView.h"
#import "MineHeader.h"
#import "MineCell.h"

#pragma mark - 声明
@interface MineView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MineHeader *header;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray<NSArray *> *datas;

@end

#pragma mark - 实现
@implementation MineView

#pragma mark - 初始化
+ (instancetype)init {
    MineView *view = [MineView loadCode:ScreenBounds];
    [view setBackgroundColor:WhiteColor];
    [view createView];
    return view;
}
- (void)createView {
    [self table];
}
- (MineHeader *)header {
    if (!_header) {
        _header = [MineHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth / 3)];
    }
    return _header;
}
- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:({
            CGFloat top = NavigationBarHeight;
            CGRectMake(0, top, ScreenWidth, ScreenHeight - top - TabbarHeight);
        }) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.tableHeaderView = [self header];
        _table.backgroundColor = ColorBg;
        _table.separatorColor = ColorBg;
        _table.separatorInset = UIEdgeInsetsMake(0, countcoordinatesX(15), 0, countcoordinatesX(15));
        [_table lineHide];
        [self addSubview:_table];
    }
    return _table;
}
- (NSArray<NSArray *> *)datas {
    if (!_datas) {
        _datas = @[@[@"设置",@"个性换肤",@"夜间模式",@"定时关闭"],@[@"分享这个App"]];
    }
    return _datas;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas[section].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineCell *cell = [MineCell initWithTable:tableView];
    cell.name.text = self.datas[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return countcoordinatesY(10);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}



@end

