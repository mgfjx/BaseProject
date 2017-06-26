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
    
}

- (void)popToRootVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@"navigation address: %p", self.navigationController);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Root" style:UIBarButtonItemStylePlain target:self action:@selector(popToRootVC)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)clicked{
    UIViewController *vc = [[NSClassFromString(@"TestViewController") alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
    if (self.tabBarController.navigationController){
        [self.tabBarController.navigationController pushViewController:vc animated:YES];
    }else if(self.navigationController){
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
