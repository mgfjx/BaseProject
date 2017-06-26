//
//  UMengShareManager.m
//  BaseProject
//
//  Created by mgfjx on 2017/6/8.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import "UMengShareManager.h"
#import <UMSocialCore/UMSocialCore.h>

// 友盟appkey
#define UMSocialAppkey @"57c407cc67e58eeaf5002785"

// 微信
#define WeChat_AppKey @"wxbdd6e19828f0b928"
#define WeChat_AppSecret @"dd85842a95d1028a44da350bd48f49b8"

// QQ
#define QQ_AppKey @"1105655362"

// 新浪
#define Sina_AppKey @"1713720627"
#define Sina_AppSecret @"350e97de6ec746a912ffbcabdaeeaddd"

// 钉钉
#define DingDing_AppKey @""

// 支付宝
#define Alipay_AppKey @""



@implementation UMengShareManager

+ (instancetype)manager{
    
    static UMengShareManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[super allocWithZone:NULL] init];
    });
    return singleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [UMengShareManager manager];
}

- (id)copyWithZone:(NSZone *)zone{
    return [UMengShareManager manager];
}


- (void)confitUShareSettings{
    
    [self configUSharePlatforms];
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMSocialAppkey];
    
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     */
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
    
}

- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WeChat_AppKey appSecret:WeChat_AppSecret redirectURL:@"http://mobile.umeng.com/social"];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQ_AppKey /*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:Sina_AppKey  appSecret:Sina_AppSecret redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    
    /* 钉钉的appKey */
    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_DingDing appKey:DingDing_AppKey appSecret:nil redirectURL:nil];
    
    /* 支付宝的appKey */
    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_AlipaySession appKey:Alipay_AppKey appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
}

-(BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

@end
