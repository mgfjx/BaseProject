//
//  MainTabBarViewController.m
//  FileStorage
//
//  Created by mgfjx on 2016/12/7.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BasicNavigationController.h"
#import "BasicViewController.h"

@interface MainTabBarViewController ()<UITabBarDelegate>

@end

@implementation MainTabBarViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self initViewControllers];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.tabBar.hidden = YES;
    [self customTabBar];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)customTabBar{
    
    NSArray *titles = @[@"title", @"title", @"title", @"title", @"title", ];
    NSArray *images = @[@"tarbar_allFile_icon", @"tarbar_img_icon", @"tarbar_music_icon", @"tarbar_video_icon", @"tarbar_music_icon",];
    NSArray *selectedImages = @[@"tarbar_allFile_icon", @"tarbar_img_icon", @"tarbar_music_icon", @"tarbar_video_icon", @"tarbar_music_icon",];
    
    BaseTabBar *tabBar = [[BaseTabBar alloc] initWithFrame:CGRectMake(0, self.view.height - 49, self.view.width, 49) titles:titles defaultImages:images selectedImages:selectedImages];
    tabBar.delegate = self;
    tabBar.tintColor = [UIColor colorWithRed:0.881 green:0.134 blue:0.875 alpha:1.000];
    tabBar.selectedIndex = 0;
    
    [self.view addSubview:tabBar];
    self.m_tabBar = tabBar;
    [self setValue:tabBar forKey:@"tabBar"];
//    self.tabBar.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)initViewControllers{
    
    NSArray *viewControllers = @[@"TestViewController",@"TestViewController",@"TestViewController",@"TestViewController",@"TestViewController"];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < viewControllers.count; i++) {
        BasicViewController *catVC = [[NSClassFromString(viewControllers[i]) alloc] init];
        catVC.title = [NSString stringWithFormat:@"VC%d", i];
        catVC.view.backgroundColor = [UIColor randomColor];
        BasicNavigationController *catNav = [[BasicNavigationController alloc] initWithRootViewController:catVC];
        [array addObject:catNav];
    }
    self.viewControllers = [array copy];
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    self.selectedIndex = item.tag;
}

@end
