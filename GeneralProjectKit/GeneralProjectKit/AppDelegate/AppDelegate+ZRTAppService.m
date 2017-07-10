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
- (void)setIQKeyboardManager
{
    //自动处理键盘事件的第三方库
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;//控制整个功能是否启用
    manager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor = YES;//控制键盘上的工具条文字颜色是否用户自定义
    manager.enableAutoToolbar = NO;//控制是否显示键盘上的工具条
    [manager setKeyboardDistanceFromTextField:0];

}
@end
