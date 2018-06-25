//
//  SHItem2.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/6/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHItem2.h"

@interface SHItem2 ()
@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;
@end

@implementation SHItem2


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

- (void)drawRect:(CGRect)rect {
    CGFloat padding = 10.0f;
    //设置背景颜色
    [[UIColor whiteColor]  set];
    UIRectFill([self bounds]);
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context, padding, 0);//设置起点
    CGContextAddLineToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width - padding, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    [[UIColor greenColor] setFill]; //设置填充色
    [[UIColor whiteColor] setStroke]; //设置边框颜色
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
}

- (void)setItemModel:(SHItemModel *)itemModel {
    _itemModel = itemModel;

    _label1.text = _itemModel.title1;
    _label1.textColor = _itemModel.color1;
    _label2.text = _itemModel.title2;
    _label2.textColor = _itemModel.color2;
}

@end
