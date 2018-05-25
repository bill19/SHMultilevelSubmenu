//
//  SHItem.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHItem.h"

@interface SHItem ()
@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;
@end


@implementation SHItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self setupSuViews];
    }
    return self;
}

- (void)setupSuViews {

    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(0, 0, self.bounds.size.width, 40);
    label1.text = @"标题1";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor grayColor];
    label1.font = [UIFont systemFontOfSize:20];
    [self addSubview:label1];
    _label1 = label1;

    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(0, 50, self.bounds.size.width, 22);
    label2.text = @"内容1";
    label2.textColor = [UIColor grayColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:12];
    [self addSubview:label2];
    _label2 = label2;

}

- (void)setItemModel:(SHItemModel *)itemModel {
    _itemModel = itemModel;

    _label1.text = _itemModel.title1;
    _label1.textColor = _itemModel.color1;
    _label2.text = _itemModel.title2;
    _label2.textColor = _itemModel.color2;
}

@end
