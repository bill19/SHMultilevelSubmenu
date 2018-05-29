//
//  SHTablesView.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/29.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHTablesView.h"
#import "Masonry.h"
#import "SHTablsCell.h"

@interface SHTablesView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation SHTablesView

- (instancetype)init
{
    self = [super init];
    if (self) {

        [self setupCollectionView];
    }
    return self;
}

- (void)setupCollectionView {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[self creatHomeLayout]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[SHTablsCell class] forCellWithReuseIdentifier:kBannerReuseIdentifier];
    _collectionView = collectionView;
    [self addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SHTablsCell *tablesCell = [collectionView dequeueReusableCellWithReuseIdentifier:kBannerReuseIdentifier forIndexPath:indexPath];
    tablesCell.tablesModel = [self modelForIndexPath:indexPath];
    return tablesCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.tables.count;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (SHTablesModel *)modelForIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.item < self.tables.count) {
        return self.tables[indexPath.item];
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.bounds.size;
}

#pragma mark - layout

- (UICollectionViewLayout *)creatHomeLayout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.collectionView.showsVerticalScrollIndicator = 0;
    layout.collectionView.showsHorizontalScrollIndicator = 0;
    layout.collectionView.pagingEnabled = YES;
    layout.collectionView.bounces = NO;
    return layout;
}

- (NSArray<SHTablesModel *> *)tables {
    if (!_tables) {
        _tables = [NSArray array];
    }
    return _tables;
}
@end
