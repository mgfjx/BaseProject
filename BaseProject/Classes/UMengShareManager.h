//
//  UMengShareManager.h
//  BaseProject
//
//  Created by mgfjx on 2017/6/8.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UMengShareManager : NSObject

+ (instancetype)manager;

- (void)confitUShareSettings;

-(BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end
