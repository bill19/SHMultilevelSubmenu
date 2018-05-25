//
//  SHSegmentController.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHSegmentController.h"
#import "HMSegmentedControl.h"
#import "SHItem.h"
#import "SHItemModel.h"
#import "UIView+ToImage.h"

@interface SHSegmentController ()
@property (nonatomic, strong) NSArray *imageSource;
@property (nonatomic, strong) NSArray *selectImageSource;
@end

@implementation SHSegmentController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupController];
}

- (void)dealloc {
    
}

#pragma mark setup controller
- (void)setupController {
    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
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
        SHItem *item = [[SHItem alloc] initWithFrame:CGRectMake(0, 0, imageWidth, 72)];
        SHItemModel *model = [SHItemModel creatItem1];
        model.title1 = source1[index];
        model.title2 = source2[index];
        item.itemModel = model;
        [muimage addObject:[item toUIImage]];
    }

    for (NSInteger index = 0; index < source1.count; index ++) {
        SHItem *item = [[SHItem alloc] initWithFrame:CGRectMake(0, 0, imageWidth, 72)];
        SHItemModel *model = [SHItemModel creatItem2];
        model.title1 = source1[index];
        model.title2 = source2[index];
        item.itemModel = model;
        [muSelect addObject:[item toUIImage]];
    }

    self.imageSource = muimage;
    self.selectImageSource = muSelect;

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
