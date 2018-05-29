//
//  SHOneTable.h
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHOneModel.h"

@interface SHOneTable : UIView

/**
 根据数据源更新tableview 展示

 @param source 数据源信息
 */
- (void)reloadOneTableWithSource:(NSArray <SHOneModel *>*)source;

@end
