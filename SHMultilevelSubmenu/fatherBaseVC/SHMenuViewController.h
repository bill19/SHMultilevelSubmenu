//
//  SHMenuViewController.h
//  SHMultilevelSubmenu
//
//  Created by sunhao on 2018/10/12.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHMenuViewController : UIViewController

/**
 控制器数据
 */
@property (nonatomic, strong) NSArray <UIViewController *>*viewControllers;

/**
 数据信息 - 标题
 */
@property (nonatomic, strong) NSArray <NSString *>*menuTitles;


@end
