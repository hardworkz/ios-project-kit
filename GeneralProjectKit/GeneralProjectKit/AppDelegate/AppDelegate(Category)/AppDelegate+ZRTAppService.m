//
//  AppDelegate+ZRTAppService.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "AppDelegate+ZRTAppService.h"

@implementation AppDelegate (ZRTAppService)

#pragma mark - Mob
- (void)registerMob
{
    [SMSSDK registerApp:SMSMobAppKeyTest
             withSecret:SMSMobAppSecretTest];
}
#pragma mark - UMengShare
- (void)registerUmeng
{
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:UmengAppKey];
    
    [self configUSharePlatforms];
}
- (void)configUSharePlatforms
{
    /*
     设置微信的appKey和appSecret
     [微信平台从U-Share 4/5升级说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_1
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WetChatAppId appSecret:WetChatAppSecret redirectURL:nil];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     100424468.no permission of union id
     [QQ/QZone平台集成说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_3
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:ShareQQAppID/*设置QQ平台的appID*/  appSecret:nil redirectURL:@""/*公司官网地址*/];
    
    /*
     设置新浪的appKey和appSecret
     [新浪微博集成说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_2
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:WeiBoAppKey  appSecret:WeiBoAppSecret redirectURL:@""];
}
#pragma mark - UmengConfigure
- (void)registerUmengConfigure
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    UMConfigInstance.appKey = UMConfigAppKey;
    UMConfigInstance.channelId = UMConfigChannelId;
    [MobClick startWithConfigure:UMConfigInstance];
}
#pragma mark - IQKeyboardManager
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
#pragma mark - avoidCrash
- (void)avoidCrash
{
    //全局启动崩溃预防
    [AvoidCrash becomeEffective];
    //监听崩溃的信息通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}
- (void)dealwithCrashMessage:(NSNotification *)note {
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    NSLog(@"%@",note.userInfo);
}
#pragma mark - realm
- (void)realmDataStructureChangesWithVersion:(uint64_t)schemaVersion
{
    // 在 [AppDelegate didFinishLaunchingWithOptions:] 中进行配置
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    // 设置新的架构版本。这个版本号必须高于之前所用的版本号（如果您之前从未设置过架构版本，那么这个版本号设置为 0）
    config.schemaVersion = schemaVersion;
    
    // 设置闭包，这个闭包将会在打开低于上面所设置版本号的 Realm 数据库的时候被自动调用
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        // 目前我们还未进行数据迁移，因此 oldSchemaVersion == 0
        if (oldSchemaVersion < 1) {
            // 什么都不要做！Realm 会自行检测新增和需要移除的属性，然后自动更新硬盘上的数据库架构
        }
    };
    
    // 告诉 Realm 为默认的 Realm 数据库使用这个新的配置对象
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    // 现在我们已经告诉了 Realm 如何处理架构的变化，打开文件之后将会自动执行迁移
    [RLMRealm defaultRealm];
    
//    作者：PerhapYs
//    链接：http://www.jianshu.com/p/096bec929f2a
//    來源：简书
//    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
}
@end
