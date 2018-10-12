//
//  ViewController3.m
//  SHMultilevelSubmenu
//
//  Created by sunhao on 2018/10/12.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}


- (void)setupView {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    label.text = NSStringFromClass([self class]);
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
}

@end
