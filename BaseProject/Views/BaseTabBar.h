//
//  BaseTabBar.h
//  BaseProject
//
//  Created by mgfjx on 2017/4/24.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBar : UITabBar

@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                defaultImages:(NSArray *)imageNames
               selectedImages:(NSArray *)selectedImageNames;

@end
