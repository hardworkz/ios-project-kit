//
//  AppDelegate+ZRTAppService.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "AppDelegate+ZRTAppService.h"

@implementation AppDelegate (ZRTAppService)

- (void)registerMob
{
    [SMSSDK registerApp:SMSMobAppKeyTest
             withSecret:SMSMobAppSecretTest];
}

- (void)registerUmeng
{
    [UMSocialData setAppKey:UmengAppKey];
    [UMSocialQQHandler setQQWithAppId:ShareQQAppID appKey:ShareQQAppKey url:@"http://xiaozhangkeji.szdtoo.com.cn"];
    [UMSocialWechatHandler setWXAppId:WetChatAppId appSecret:WetChatAppSecret url:@"http://xiaozhangkeji.szdtoo.com.cn"];
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline]];
}
- (void)registerUmengConfigure
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    UMConfigInstance.appKey = UMConfigAppKey;
    UMConfigInstance.channelId = UMConfigChannelId;
    [MobClick startWithConfigure:UMConfigInstance];
}
@end
