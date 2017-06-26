//
//  BaseTabBar.m
//  BaseProject
//
//  Created by mgfjx on 2017/4/24.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import "BaseTabBar.h"

@implementation BaseTabBar

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                defaultImages:(NSArray *)imageNames
               selectedImages:(NSArray *)selectedImageNames {
    self = [super initWithFrame:frame];
    if (self) {
        
        NSAssert(titles.count == imageNames.count, @"The number of tabBar titles and the number of tabBar images are not equal");
        
        NSMutableArray *items = [NSMutableArray array];
        
        if (!selectedImageNames || selectedImageNames.count <= 0) {
            //no selected images
            for (int i = 0; i < imageNames.count; i++) {
                UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titles[i] image:[UIImage imageNamed:imageNames[i]] tag:i];
                [items addObject:item];
                item.badgeColor = [UIColor redColor];
                item.badgeValue = @"99+";
            }
        }else{
            //has selected images
            for (int i = 0; i < imageNames.count; i++) {
                UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titles[i] image:[UIImage imageNamed:imageNames[i]] selectedImage:[UIImage imageNamed:selectedImageNames[i]]];
                item.tag = i;
                [items addObject:item];
            }
        }
        
        self.items = [items copy];
    }
    return self;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    self.selectedItem = self.items[selectedIndex%(self.items.count)];
}

@end
