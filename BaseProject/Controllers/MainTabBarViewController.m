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

@interface MainTabBarViewController ()<UITabBarDelegate, BasicViewControllerDelegete>

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
    
    
    [self customTabBar];
    
}

- (void)customTabBar{
    
    NSArray *titles = @[@"title", @"title", @"title", @"title", @"title", ];
    NSArray *images = @[@"tarbar_allFile_icon", @"tarbar_img_icon", @"tarbar_music_icon", @"tarbar_video_icon", @"tarbar_music_icon",];
    NSArray *selectedImages = @[@"tarbar_allFile_icon", @"tarbar_img_icon", @"tarbar_music_icon", @"tarbar_video_icon", @"tarbar_music_icon",];
    
    BaseTabBar *tabBar = [[BaseTabBar alloc] initWithFrame:CGRectMake(0, self.view.height - 49, self.view.width, 49) titles:titles defaultImages:images selectedImages:selectedImages];
    tabBar.delegate = self;
    tabBar.tintColor = [UIColor colorWithRed:0.881 green:0.134 blue:0.875 alpha:1.000];
    tabBar.selectedIndex = 0;
    [self.tabBar addSubview:tabBar];
    self.m_tabBar = tabBar;
    
}

- (void)initViewControllers{
    
    NSArray *viewControllers = @[@"TestViewController",@"TestViewController",@"TestViewController",@"TestViewController",@"TestViewController"];
    
    for (int i = 0; i < viewControllers.count; i++) {
        BasicViewController *catVC = [[NSClassFromString(viewControllers[i]) alloc] init];
        catVC.title = [NSString stringWithFormat:@"ViewController%d", i];
        catVC.view.backgroundColor = [UIColor randomColor];
        catVC.delegate = self;
        UINavigationController * catNav = [[BasicNavigationController alloc] initWithRootViewController:catVC];
        [self addChildViewController:catNav];
    }
    
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    self.selectedIndex = item.tag;
}

#pragma mark - BasicViewControllerDelegete
- (void)hidesBottomBar:(BOOL)hidden{
    BaseTabBar *tabBar = self.m_tabBar;
    
    CGFloat yPosition = 0;
    if (hidden) {
        yPosition = tabBar.y + tabBar.height;
    }else{
        yPosition = tabBar.y - tabBar.height;
    }
    
//    [UIView animateWithDuration:0.25 animations:^{
//        tabBar.y = yPosition;
//    } completion:^(BOOL finished) {
//        tabBar.hidden = hidden;
//    }];
    
}

@end
