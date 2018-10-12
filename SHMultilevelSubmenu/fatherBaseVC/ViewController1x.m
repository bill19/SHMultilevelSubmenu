//
//  ViewController1x.m
//  SHMultilevelSubmenu
//
//  Created by sunhao on 2018/10/12.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController1x.h"

@interface ViewController1x ()

@end

@implementation ViewController1x

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
