//
//  SHMultilevelSubmenu.h
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "SHMuSubmenuConfig.h"

typedef void(^MultilevelSubmenuClick)(NSInteger section ,NSInteger index ,NSArray *selects);

static CGFloat const kUnitSubmenuHeight = 44.0f;
@interface SHMultilevelSubmenu : UIView

/**
  创建有几级 的数据

 @param level 级别信息
 @param normalSorce 默认情况下展示的层级层数
 @return 创建信息
 */
- (instancetype)initWithLevel:(NSInteger)level normalSource:(NSArray <NSArray <NSString *>* > *)normalSorce;


/**
 更新某一行

 @param level 更新某一级的信息
 @param index 哪一个被选中
 @param source 更新的数据信息
 */
- (void)updateSegmetLevel:(NSInteger)level index:(NSInteger)index source:(NSArray *)source;

//点击了 某一组 某一个 获取目前所有选中的信息
@property (nonatomic, copy) MultilevelSubmenuClick indexChange;

@end
