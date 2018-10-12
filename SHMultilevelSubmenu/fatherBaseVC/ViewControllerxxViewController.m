//
//  ViewControllerxxViewController.m
//  SHMultilevelSubmenu
//
//  Created by sunhao on 2018/10/12.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewControllerxxViewController.h"
#import "ViewController1x.h"
#import "ViewController2.h"
#import "ViewController3.h"
@interface ViewControllerxxViewController ()

@end

@implementation ViewControllerxxViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *mu = [NSMutableArray array];
    NSMutableArray *mu2 = [NSMutableArray array];

    ViewController1x *vc1 = [ViewController1x new];
    ViewController2 *vc2 = [ViewController2 new];
    ViewController3 *vc3 = [ViewController3 new];
    [mu addObject:vc1];
    [mu addObject:vc2];
    [mu addObject:vc3];

    self.viewControllers = mu;

    for (NSInteger index = 0; index < mu.count; index++) {
        [mu2 addObject:NSStringFromClass([mu[index] class])];
    }
    self.menuTitles = mu2;

}

@end
