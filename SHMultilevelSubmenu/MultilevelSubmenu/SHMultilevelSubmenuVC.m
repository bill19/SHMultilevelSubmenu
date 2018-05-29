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
    [self setupButton];

    [self setupMultilevelSubmenu];
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
    menu.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, kUnitSubmenuHeight * mu1.count);
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
