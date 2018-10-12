//
//  ViewController.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHSegmentController.h"
#import "SHMultilevelSubmenuVC.h"
#import "SHLrregularController.h"
#import "ViewControllerxxViewController.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *tableDataSource;

@end

@implementation ViewController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupController];
    [self request];
}

- (void)dealloc {
    
}

#pragma mark setup controller
- (void)setupController {
    self.title = @"HMSement使用";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark layout subviews
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Layout subviews in this method.
}

#pragma mark - button action

#pragma mark - gesture

#pragma mark - KVO

#pragma mark - noticfication

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
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self modelForIndexPath:indexPath];
    return cell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [self.navigationController pushViewController:[SHSegmentController new] animated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:[SHMultilevelSubmenuVC new] animated:YES];
        }
            break;

        case 2:
        {
            [self.navigationController pushViewController:[SHLrregularController new] animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[ViewControllerxxViewController new] animated:YES];
        }
            break;

        default:
            break;
    }
}

#pragma mark - HTTP request
- (void)request {

    [self.tableView reloadData];
}

#pragma mark - model handler
- (NSString *)modelForIndexPath:(NSIndexPath *)indexPath {
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
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 100.0f;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = [UITableViewHeaderFooterView new];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSArray *)tableDataSource {

    if (!_tableDataSource) {
        _tableDataSource = @[@"Segment",@"多级菜单",@"不规则",@"Father"];
    }
    return _tableDataSource;

}
@end
