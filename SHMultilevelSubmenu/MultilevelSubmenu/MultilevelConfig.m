//
//  MultilevelConfig.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/25.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "MultilevelConfig.h"

@implementation MultilevelConfig

+ (HMSegmentedControl *)segCreat {

    HMSegmentedControl *segment = [[HMSegmentedControl alloc] init];
    segment.backgroundColor = [UIColor redColor];
    segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
    segment.selectedSegmentIndex = 0;
    segment.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    segment.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor greenColor],
                                    NSFontAttributeName:[UIFont systemFontOfSize:13]};
    segment.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor yellowColor],
                                            NSFontAttributeName:[UIFont systemFontOfSize:13]};
    return segment;
}
@end
