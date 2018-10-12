//
//  SHMenuViewController.m
//  SHMultilevelSubmenu
//
//  Created by sunhao on 2018/10/12.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHMenuViewController.h"
#import "HMSegmentedControl.h"
@interface SHMenuViewController ()
@property (nonatomic, strong) HMSegmentedControl *segment;
@property (nonatomic, strong) UIViewController *currentViewController;//当前展示的控制器
@property (nonatomic, assign) NSInteger currentIndex;//记录下当前的index
@end

@implementation SHMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView =  self.segment;
    __weak __typeof(self)weakSelf = self;
    [self.segment setIndexChangeBlock:^(NSInteger index) {

        [weakSelf didSelectIndex:index];
    }];
}

- (void)didSelectIndex:(NSInteger)index {
    [self transitionFromViewController:self.currentViewController toViewController:self.viewControllers[index] duration:.3 options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {

        self.currentViewController = self.viewControllers[index];
    }];
}


- (HMSegmentedControl *)segment {
    if (!_segment) {
        HMSegmentedControl *segment = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"xx",@"xxxx"]];
        segment.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 44);
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
        _segment = segment;
    }
    return _segment;
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;

    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addChildViewController:obj];
    }];
    self.currentViewController = [self.viewControllers firstObject];
    [self.view addSubview:self.currentViewController.view];
}

- (void)setMenuTitles:(NSArray<NSString *> *)menuTitles {
    _menuTitles = menuTitles;

    self.segment.sectionTitles = self.menuTitles;
}

@end
