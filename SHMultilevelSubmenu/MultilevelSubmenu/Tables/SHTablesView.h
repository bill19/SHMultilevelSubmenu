//
//  SHTablesView.h
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/29.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHTablesModel.h"
static NSString * kBannerReuseIdentifier = @"SHTablsCell";
static CGFloat const kTablesViewHeight = 300.0f;

@interface SHTablesView : UIView

@property (nonatomic, strong) NSArray <SHTablesModel *>* tables;

@end
