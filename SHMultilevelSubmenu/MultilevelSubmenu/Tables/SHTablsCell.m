//
//  SHTablsCell.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/29.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHTablsCell.h"
#import "SHOneTable.h"

@interface SHTablsCell()
@property (nonatomic, weak) SHOneTable *tableView;

@end

@implementation SHTablsCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        SHOneTable *tableView = [[SHOneTable alloc] initWithFrame:self.bounds];
        _tableView = tableView;
        [self addSubview:_tableView];
    }
    return self;
}

- (void)setTablesModel:(SHTablesModel *)tablesModel {
    _tablesModel = tablesModel;

    [_tableView reloadOneTableWithSource:_tablesModel.tableDataSource];
}


@end
