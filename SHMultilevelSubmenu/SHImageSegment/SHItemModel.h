//
//  SHItemModel.h
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHItemModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title1;

@property (nonatomic, strong) UIColor *color1;

@property (nonatomic, copy) NSString *title2;

@property (nonatomic, strong) UIColor *color2;

+ (SHItemModel *)creatItem1;
+ (SHItemModel *)creatItem2;

@end
