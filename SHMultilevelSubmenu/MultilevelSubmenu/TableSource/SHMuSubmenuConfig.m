//
//  SHMuSubmenuConfig.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHMuSubmenuConfig.h"

@implementation SHMuSubmenuConfig

+ (HMSegmentedControl *)creatFirstSegment {
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] init];
    segmentedControl.sectionTitles = @[@"🌺",@"草", @"🌲", @"木"];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor],
                                             NSFontAttributeName:[UIFont systemFontOfSize:13]};
    segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor redColor],
                                                     NSFontAttributeName:[UIFont systemFontOfSize:13]};

    segmentedControl.selectionIndicatorColor = [UIColor redColor];
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionIndicatorHeight = 2;
    return segmentedControl;
}


+ (HMSegmentedControl *)creatimageSegment {
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] init];
//    segmentedControl.sectionTitles = @[@"🌺",@"草", @"🌲", @"木"];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor],
                                             NSFontAttributeName:[UIFont systemFontOfSize:13]};
    segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor redColor],
                                                     NSFontAttributeName:[UIFont systemFontOfSize:13]};

    segmentedControl.selectionIndicatorColor = [UIColor redColor];
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionIndicatorHeight = 2;
    return segmentedControl;
}
@end
