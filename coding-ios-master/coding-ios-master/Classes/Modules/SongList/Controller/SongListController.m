//
//  SongListController.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SongListController.h"
#import "SongListHeader.h"
#import "SongListCell.h"

#pragma mark - 声明
@interface SongListController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) KKNavigationBar *bar;
@property (nonatomic, strong) SongListHeader *header;
@property (nonatomic, strong) UITableView *table;

@end

#pragma mark - 实现
@implementation SongListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
- (void)createView {
    [self bar];
    [self setJz_wantsNavigationBarVisible:NO];
    [self table];
}
- (KKNavigationBar *)bar {
    if (!_bar) {
        _bar = [KKNavigationBar init];
        [self.view addSubview:_bar];
    }
    return _bar;
}
- (SongListHeader *)header {
    if (!_header) {
        _header = [SongListHeader initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
        _header.backgroundColor = [UIColor redColor];
    }
    return _header;
}
- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, NavigationBarHeight, ScreenWidth, ScreenHeight - NavigationBarHeight) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.tableHeaderView = [self header];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_table lineHide];
        [self.view addSubview:_table];
    }
    return _table;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongListCell *cell = [SongListCell initWithTable:tableView];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayController *vc = [[PlayController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [StatusUtils setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

@end





