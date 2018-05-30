//
//  SHMultilevelSubmenu.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHMultilevelSubmenu.h"

@interface SHMultilevelSubmenu ()

/**
 最高层级层数
 */
@property (nonatomic, assign) NSInteger level;
/**
 默认情况下展示的数据源信息
 */
@property (nonatomic, strong) NSArray <NSArray <NSString *>* > *normalSorce;

/**
 默认情况下展示的数据源信息
 */
@property (nonatomic, strong) NSArray <NSArray <UIImage *>* > *sectionImages;

/**
 默认情况下展示的数据源信息 选中状态的image
 */
@property (nonatomic, strong) NSArray <NSArray <UIImage *>* > *selectImages;


/**
 层级segment数据源
 */
@property (nonatomic, strong) NSArray <HMSegmentedControl *>*segmentSource;
@end

@implementation SHMultilevelSubmenu

- (instancetype)initWithLevel:(NSInteger)level normalSource:(NSArray <NSArray <NSString *>* > *)normalSorce
{
    self = [super init];
    if (self) {
        self.level = level;
        self.normalSorce = normalSorce;
        [self setupSubViews];
        
    }
    return self;
}

- (instancetype)initWithLevel:(NSInteger)level sectionImages:(NSArray <NSArray <UIImage *>* > *)sectionImages selectImages:(NSArray <NSArray <UIImage *>* > *)selectImages {

    self = [super init];
    if (self) {
        self.level = level;
        self.sectionImages = sectionImages;
        self.selectImages  = selectImages;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    __weak typeof(self) weakself = self;
    NSMutableArray *mu = [NSMutableArray array];

    if (self.sectionImages) {//添加的是图片
        [weakself.sectionImages enumerateObjectsUsingBlock:^(NSArray<UIImage *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMSegmentedControl * segment = [[HMSegmentedControl alloc] initWithSectionImages:[weakself menuItemFromImages:obj] sectionSelectedImages:[weakself menuItemFromImages:[weakself.selectImages objectAtIndex:idx]]];
            segment.frame = CGRectMake(0, idx * 72, [UIScreen mainScreen].bounds.size.width, 72);
            segment.selectedSegmentIndex = 0;
            segment.backgroundColor = [UIColor whiteColor];
            segment.selectionIndicatorColor = [UIColor redColor];
            segment.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
            segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
            segment.selectionIndicatorHeight = 2;
            segment.indexChangeBlock = ^(NSInteger index) {
                if (weakself.indexChange) {
                    weakself.indexChange(idx, index ,[weakself getSelects]);
                }
            };
            [weakself addSubview:segment];
            [mu addObject:segment];
        }];
    }

    if (self.normalSorce) {//添加的是Titles
        [weakself.normalSorce enumerateObjectsUsingBlock:^(NSArray<NSString *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMSegmentedControl * segment = [SHMuSubmenuConfig creatFirstSegment];
            segment.frame = CGRectMake(0, idx * kUnitSubmenuHeight, [UIScreen mainScreen].bounds.size.width, kUnitSubmenuHeight);
            segment.sectionTitles = [weakself menuItemFromSource:obj];
            segment.indexChangeBlock = ^(NSInteger index) {
                if (weakself.indexChange) {
                    weakself.indexChange(idx, index ,[weakself getSelects]);
                }
            };
            [weakself addSubview:segment];
            [mu addObject:segment];
        }];
    }

    self.segmentSource = mu;

}

/**
 更新某一行

 @param level 更新某一级的信息
 @param index 哪一个被选中
 @param source 更新的数据信息
 */
- (void)updateSegmetLevel:(NSInteger)level index:(NSInteger)index source:(NSArray *)source {

    HMSegmentedControl *seg = [self.segmentSource objectAtIndex:level];
    [seg setSectionTitles:source];
    [seg setSelectedSegmentIndex:index];

    if (self.indexChange) {
        self.indexChange(level, index ,[self getSelects]);
    }

}

- (NSArray *)menuItemFromSource:(NSArray <NSString *>*)source {
    NSMutableArray *mu = [NSMutableArray array];
    [source enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mu addObject:obj];
    }];
    return mu;
}

- (NSArray *)menuItemFromImages:(NSArray <UIImage *>*)images{
    NSMutableArray *mu = [NSMutableArray array];
    [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mu addObject:obj];
    }];
    return mu;
}

/**
 获取当前选中的数据

 @return 选中的所有数据
 */
- (NSArray *)getSelects {
    NSMutableArray *mu = [NSMutableArray array];
    [self.segmentSource enumerateObjectsUsingBlock:^(HMSegmentedControl * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mu addObject:@(obj.selectedSegmentIndex)];
    }];
    return mu;
}

- (NSArray *)segmentSource {
    if (!_segmentSource ) {
        _segmentSource = [NSArray array];
    }
    return _segmentSource;
}

@end
