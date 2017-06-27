//
//  ShareViewController.m
//  BaseProject
//
//  Created by mgfjx on 2017/4/28.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"分享";
    
    allKeys = @[@"微信聊天分享", @"微信朋友圈分享", @"微信收藏", @"QQ分享", @"QQZone分享", @"sina微博分享"];
    allValues = @[@(UMSocialPlatformType_WechatSession),
                  @(UMSocialPlatformType_WechatTimeLine),
                  @(UMSocialPlatformType_WechatFavorite),
                  @(UMSocialPlatformType_QQ),
                  @(UMSocialPlatformType_Qzone),
                  @(UMSocialPlatformType_Sina),
                  ];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UMSocialPlatformType type = (UMSocialPlatformType)[allValues[indexPath.row] integerValue];
    [self shareWebPageToPlatformType:type];
    
}

- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:@"icon"];
    [shareObject setShareImage:@"https://mobile.umeng.com/images/pic/home/social/img-1.png"];
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}

@end
