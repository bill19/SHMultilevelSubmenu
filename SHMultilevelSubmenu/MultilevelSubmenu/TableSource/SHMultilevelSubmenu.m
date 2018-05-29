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


- (void)setupSubViews {
    __weak typeof(self) weakself = self;
    NSMutableArray *mu = [NSMutableArray arrayWithCapacity:self.normalSorce.count];
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
