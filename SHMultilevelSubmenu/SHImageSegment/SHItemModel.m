//
//  SHItemModel.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHItemModel.h"

@implementation SHItemModel

+ (SHItemModel *)creatItem1 {
    SHItemModel *item = [[SHItemModel alloc] init];
    item.color1 = [UIColor grayColor];
    item.color2 = [UIColor grayColor];
    return item;
}
+ (SHItemModel *)creatItem2 {
    SHItemModel *item = [[SHItemModel alloc] init];
    item.color1 = [UIColor colorWithRed:255.0/255.0 green:199.0/255.0 blue:10.0/255.0 alpha:1];;
    item.color2 = [UIColor grayColor];
    return item;
}
@end
