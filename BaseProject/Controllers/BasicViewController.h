//
//  BasicViewController.h
//  FileStorage
//
//  Created by mgfjx on 16/10/12.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BasicViewControllerDelegete <NSObject>

- (void)hidesBottomBar:(BOOL)hidden;

@end

@interface BasicViewController : UIViewController

@property (nonatomic, weak) id delegate;

@end
