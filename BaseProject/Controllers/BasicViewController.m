//
//  BasicViewController.m
//  FileStorage
//
//  Created by mgfjx on 16/10/12.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createCustomNavigationBar];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
}

- (void)createCustomNavigationBar{
    
    //navigation background view
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
    bgView.backgroundColor = [UIColor randomColor];
    [self.view addSubview:bgView];
    navigationView = bgView;
    
    //back button
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 20, 46, 46);
    [backBtn setImage:[UIImage imageNamed:@"news_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backBtn];
    backButton = backBtn;
    
    //title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 46)];
    titleLabel.center = CGPointMake(bgView.width/2, 20 + 23);
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.backgroundColor =[UIColor clearColor];
    titleLabel.hidden = NO;
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    [bgView addSubview:titleLabel];
    title = titleLabel;
    
}

- (void)backBtnClicked{
    if (self.presentingViewController || !self.navigationController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
