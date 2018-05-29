//
//  SHMultilevelSubmenuVC.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHMultilevelSubmenuVC.h"
#import "HMSegmentedControl.h"
#import "SHMuSubmenuConfig.h"
#import "SHMultilevelSubmenu.h"
#import "NSString+MTRandom.h"
#import "SHTablesView.h"
#import "SHTablesModel.h"
#import "SHOneModel.h"
#import "Masonry.h"

@interface SHMultilevelSubmenuVC ()
@property (nonatomic, strong) SHMultilevelSubmenu *menu;
@end

@implementation SHMultilevelSubmenuVC

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupController];
    [self request];
//    [self setupButton];

    [self setupMultilevelSubmenu];
    [self setupSHTablesView];
}

- (void)dealloc {
    
}

#pragma mark setup controller
- (void)setupController {
    self.title = @"多级菜单展示";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark layout subviews
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Layout subviews in this method.
}

- (void)setupMultilevelSubmenu {
    NSMutableArray *mu1 = [NSMutableArray array];
    for (NSInteger index = 0; index < 2; index ++) {
        NSMutableArray *mu2 = [NSMutableArray array];
        for (NSInteger index0 = 0; index0 < 4; index0 ++) {
            [mu2 addObject:[NSString randomStringWithLength:(random() % 8)]];
        }
        [mu1 addObject:mu2];
    }
    SHMultilevelSubmenu *menu = [[SHMultilevelSubmenu alloc] initWithLevel:mu1.count normalSource:mu1];
    menu.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kUnitSubmenuHeight * mu1.count);
    menu.indexChange = ^(NSInteger section, NSInteger index, NSArray *selects) {
        NSLog(@"section = %ld index = %ld,selects %@",section,index,selects);
    };
    [self.view addSubview:menu];
    _menu = menu;
    
}

- (void)setupButton {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(0, 0, 100, 100);
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)buttonClick:(UIButton *)sender {
    [_menu updateSegmetLevel:2 index:2 source:@[@"1",@"2",@"3",@"4",@"5"]];
}

- (void)setupSHTablesView {
    NSMutableArray *mu1 = [NSMutableArray array];
    for (NSInteger index = 0; index < 3; index ++) {
        NSMutableArray *mu2 = [NSMutableArray array];
        for (NSInteger indx = 0; indx < 50; indx ++) {
            SHOneModel *oneM = [SHOneModel new];
            oneM.title = [NSString randomStringWithLength:(random() % 8)];
            oneM.imageN = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527583058169&di=bb9f0f373276cedcdc7ba99b551904eb&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01eacd5846676da8012060c8847ba4.png%401280w_1l_2o_100sh.png";
            [mu2 addObject:oneM];
        }

        SHTablesModel *model = [[SHTablesModel alloc] init];
        model.index = index;
        model.tableDataSource = mu2;
        [mu1 addObject:model];
    }
    SHTablesView *tabl = [[SHTablesView alloc] init];
    tabl.tables = mu1;
    [self.view addSubview:tabl];
    [tabl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.menu.mas_bottom);
        make.left.right.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
        }
    }];
}

#pragma mark - button action

#pragma mark - gesture

#pragma mark - KVO

#pragma mark - noticfication

#pragma mark - delegate

#pragma mark - data source

#pragma mark - HTTP request
- (void)request {
    
}

#pragma mark - model handler

#pragma mark - others

#pragma mark - setters

#pragma mark getters

@end
