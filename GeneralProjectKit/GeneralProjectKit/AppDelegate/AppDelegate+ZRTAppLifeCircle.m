//
//  AppDelegate+ZRTAppLifeCircle.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "AppDelegate+ZRTAppLifeCircle.h"
#import <UserNotifications/UserNotifications.h>

@implementation AppDelegate (ZRTAppLifeCircle)
#pragma mark - UIApplicationDelegate 推送相关

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 注册APNS成功, 注册deviceToken
//    [MiPushSDK bindDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // 注册APNS失败.
    // 自行处理.
    NSLog(@"error: %@", [error localizedDescription]);
}
//接收到通知调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}
// 点击通知进入应用iOS7+
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    
}
// 点击通知进入应用iOS10+
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{

}
#pragma mark - UIApplicationDelegate 回调url相关
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    return YES;
    
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    
    return YES;
}

//#define __IPHONE_10_0    100000
//#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    
    return YES;
}

@end
