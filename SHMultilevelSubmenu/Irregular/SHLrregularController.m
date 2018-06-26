//
//  SHLrregularController.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/6/26.
//  Copyright © 2018年 SHKIT. All rights reserved.
//
//  不规则的图形
#import "SHLrregularController.h"
#import "SHMuSubmenuConfig.h"
#import "HMSegmentedControl.h"
#import "SHItem2.h"
@interface SHLrregularController ()
@property (nonatomic, strong) SHItem2 *mobView;
@end

@implementation SHLrregularController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat wid = [UIScreen mainScreen].bounds.size.width * 0.25 ;
    
    SHItem2 *mobView = [[SHItem2 alloc] initWithFrame:CGRectMake(-10, 100, wid , 48.0f)];
    mobView.backgroundColor = [UIColor clearColor];
    self.mobView = mobView;
    [self.view addSubview:_mobView];

    HMSegmentedControl *segement = [SHMuSubmenuConfig creatimageSegment2];
    segement.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 48.0f);
    [self.view addSubview:segement];
    CGFloat timeTl = 0.25f;
    [segement setIndexChangeBlock:^(NSInteger index) {
        if (index == 0) {
            [UIView animateWithDuration:timeTl animations:^{
                self.mobView.frame = CGRectMake(-10, 100, wid + 20, 48.0f);
            }];
        }else if (index == 3){
            [UIView animateWithDuration:timeTl animations:^{
                self.mobView.frame = CGRectMake(index * wid , 100, wid + 20, 48.0f);
            }];
        }else{
            [UIView animateWithDuration:timeTl animations:^{
                self.mobView.frame = CGRectMake(index * wid , 100, wid + 20, 48.0f);
            }];
        }
    }];


    self.view.backgroundColor = [UIColor whiteColor];


}

@end
