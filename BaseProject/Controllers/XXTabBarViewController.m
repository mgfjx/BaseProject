//
//  XXTabBarViewController.m
//  BaseProject
//
//  Created by mgfjx on 2017/4/28.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import "XXTabBarViewController.h"
#import "BaseTabBar.h"

@interface XXTabBarViewController ()<UITabBarDelegate>{
    NSArray *childViewControllers;
}

@property (nonatomic, strong) BaseTabBar *m_tabBar;

@end

@implementation XXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewControllers];
    
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
}

- (void)initViewControllers{
    
    NSArray *viewControllers = @[@"TestViewController",@"TestViewController",@"TestViewController",@"TestViewController",@"TestViewController"];
//    NSArray *titles = @[@"title", @"title", @"title", @"title", @"title", ];
    NSArray *images = @[@"tarbar_allFile_icon", @"tarbar_img_icon", @"tarbar_music_icon", @"tarbar_video_icon", @"tarbar_music_icon",];
    NSArray *selectedImages = @[@"tarbar_allFile_icon", @"tarbar_img_icon", @"tarbar_music_icon", @"tarbar_video_icon", @"tarbar_music_icon",];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < viewControllers.count; i++) {
        BasicViewController *vc = [[NSClassFromString(viewControllers[i]) alloc] init];
        vc.title = [NSString stringWithFormat:@"VC%d", i];
        vc.view.backgroundColor = [UIColor randomColor];
        vc.tabBarItem.image = [UIImage imageNamed:images[i]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImages[i]];
        
        BasicNavigationController *nav = [[BasicNavigationController alloc] initWithRootViewController:vc];
        [array addObject:nav];
        [self addChildViewController:nav];
    }
    
    self.viewControllers = [array copy];
    
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}

@end
