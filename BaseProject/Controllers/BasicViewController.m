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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.delegate && [self.delegate respondsToSelector:@selector(hidesBottomBar:)]) {
        [self.delegate hidesBottomBar:NO];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.delegate && [self.delegate respondsToSelector:@selector(hidesBottomBar:)]) {
        [self.delegate hidesBottomBar:YES];
    }
}

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
