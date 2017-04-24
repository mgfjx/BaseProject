//
//  TestViewController.m
//  BaseProject
//
//  Created by mgfjx on 2017/4/24.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor randomColorWithAlpha:0.4];
    [self.view addSubview:btn];
    
    self.navigationController.hidesBottomBarWhenPushed = YES;
}

- (void)clicked{
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
