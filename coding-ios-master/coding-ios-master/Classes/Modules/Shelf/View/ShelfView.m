//
//  ShelfView.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/3.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "ShelfView.h"
#import "ShelfHeader.h"
#import "ShelfListCell.h"

#pragma mark - 声明
@interface ShelfView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) NSArray<NSArray *> *datas;

@end

#pragma mark - 实现
@implementation ShelfView

#pragma mark - 初始化
+ (instancetype)init {
    ShelfView *view = [[ShelfView alloc] initWithFrame:ScreenBounds];
    [view createView];
    return view;
}
- (void)createView {
    [self table];
}
- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:({
            CGFloat top = NavigationBarHeight;
            CGRectMake(0, top, ScreenWidth, ScreenHeight - top - TabbarHeight);
        }) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorColor = ColorBg;
        [_table lineHide];
        [_table lineAll];
        [self addSubview:_table];
    }
    return _table;
}
- (NSArray<NSArray *> *)datas {
    if (!_datas) {
        _datas = @[@[@"本地音乐",@"最近播放",@"我的收藏"],
                   @[@"code_prodoct_20x17_",@"code_prodoct_20x17_",@"code_prodoct_20x17_"]];
    }
    return _datas;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas[0].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShelfListCell *cell = [ShelfListCell initWithTable:tableView];
    cell.name.text = self.datas[0][indexPath.row];
    cell.icon.image = [UIImage imageNamed:self.datas[1][indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return countcoordinatesY(50);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ShelfController *vc = [[ShelfController alloc] init];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}



@end
