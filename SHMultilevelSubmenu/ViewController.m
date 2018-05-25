//
//  ViewController.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/24.
//  Copyright © 2018年 SHKIT. All rights reserved.
//  多级子菜单刷列表数据

#import "ViewController.h"
#import "HMSegmentedControl.h"

@interface ViewController ()
@property (nonatomic, strong) HMSegmentedControl *firstSegment;
@property (nonatomic, strong) NSArray *imageSource;
@property (nonatomic, strong) NSArray *selectImageSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLabel];
    [self setSegment];

}
- (HMSegmentedControl *)setSegment {

    HMSegmentedControl *segment = [[HMSegmentedControl alloc] initWithSectionImages:self.imageSource sectionSelectedImages:self.selectImageSource];
    segment.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100);
    segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segment.selectionIndicatorColor = [UIColor colorWithRed:255.0/255.0 green:199.0/255.0 blue:10.0/255.0 alpha:1];

    segment.selectedSegmentIndex = 0;
    segment.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    segment.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor greenColor],
                                    NSFontAttributeName:[UIFont systemFontOfSize:13]};
    segment.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor yellowColor],
                                            NSFontAttributeName:[UIFont systemFontOfSize:13]};
    segment.verticalDividerEnabled = YES;
    
    CGFloat color = 239.0/255.0;
    segment.verticalDividerColor = [UIColor colorWithRed:color green:color blue:color alpha:1];
    [self.view addSubview:segment];

    return segment;
}

- (void)setupLabel {
    NSMutableArray *muimage = [NSMutableArray array];
    NSMutableArray *muSelect = [NSMutableArray array];
    CGFloat imageWidth = [UIScreen mainScreen].bounds.size.width * 0.23;
    NSArray *source1 = @[@"31",@"128",@"22.25",@"12.8"];
    NSArray *source2 = @[@"单价",@"面积",@"金额",@"侧面"];

    for (NSInteger index = 0; index < source1.count; index ++) {
        UIView *view1 = [[UIView alloc] init];
        view1.frame = CGRectMake(0, 0, imageWidth, 72);

        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, imageWidth, 40);
        label.text = [source1 objectAtIndex:index];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:14];
        [view1 addSubview:label];

        UILabel *label2 = [[UILabel alloc] init];
        label2.frame = CGRectMake(0, 50, imageWidth, 22);
        label2.text = [source2 objectAtIndex:index];
        label2.textColor = [UIColor grayColor];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:12];
        [view1 addSubview:label2];

        [muimage addObject:[self imageWithUIView:view1]];
    }

    for (NSInteger index = 0; index < source2.count; index ++) {

        UIView *view1 = [[UIView alloc] init];
        view1.frame = CGRectMake(0, 0, imageWidth, 72);

        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, imageWidth, 40);
        label.text = [source1 objectAtIndex:index];
        label.textColor = [UIColor colorWithRed:255.0/255.0 green:199.0/255.0 blue:10.0/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [view1 addSubview:label];

        UILabel *label2 = [[UILabel alloc] init];
        label2.frame = CGRectMake(0, 50, imageWidth, 22);
        label2.text = [source2 objectAtIndex:index];
        label2.textColor = [UIColor grayColor];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:12];
        [view1 addSubview:label2];
        [muSelect addObject:[self imageWithUIView:view1]];
    }
    self.imageSource = muimage;
    self.selectImageSource = muSelect;

}

- (UIImage *)imageWithUIView:(UIView*)view {
    CGSize s = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (NSArray *)imageSource {

    if (!_imageSource) {
        _imageSource = [NSArray array];
    }
    return _imageSource;
}

- (NSArray *)selectImageSource {
    if (!_selectImageSource) {
        _selectImageSource = [NSArray array];
    }
    return _selectImageSource;
}

@end
