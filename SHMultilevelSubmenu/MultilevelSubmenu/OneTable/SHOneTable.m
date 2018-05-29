//
//  SHOneTable.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHOneTable.h"
#import "Masonry.h"
#import "SHOneTableCell.h"

@interface SHOneTable () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray <SHOneModel *>*tableDataSource;

@end


@implementation SHOneTable

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.tableView registerClass:[SHOneTableCell class] forCellReuseIdentifier:@"SHOneTableCell"];

    }
    return self;
}


/**
 根据数据源更新tableview 展示

 @param source 数据源信息
 */
- (void)reloadOneTableWithSource:(NSArray <SHOneModel *>*)source {
    
    self.tableDataSource = source;
    [self.tableView reloadData];
}

#pragma mark - data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SHOneTableCell *oneTableCell = [SHOneTableCell cellWithTableView:tableView];
    oneTableCell.oneModel = [self modelForIndexPath:indexPath];
    return oneTableCell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark - model handler
- (SHOneModel *)modelForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.tableDataSource.count) {
        return self.tableDataSource[indexPath.row];
    }
    return nil;
}

#pragma mark - others

#pragma mark - setters

#pragma mark getters
- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 100.0f;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = [UITableViewHeaderFooterView new];
        [self addSubview:tableView];
        _tableView = tableView;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self);
            if (@available(iOS 11.0, *)) {
                make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.equalTo(self);
            }
        }];
    }
    return _tableView;
}

- (NSArray<SHOneModel *> *)tableDataSource {

    if (!_tableDataSource) {
        _tableDataSource = [NSArray array];
    }
    return _tableDataSource;

}

@end
