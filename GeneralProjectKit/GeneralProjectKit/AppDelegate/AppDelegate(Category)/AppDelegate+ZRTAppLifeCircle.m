//
//  AppDelegate+ZRTAppLifeCircle.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "AppDelegate+ZRTAppLifeCircle.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()<WXApiDelegate>

@end
@implementation AppDelegate (ZRTAppLifeCircle)
#pragma mark - UIApplicationDelegate 推送相关

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 注册APNS成功, 注册deviceToken
//    [MiPushSDK bindDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // 注册APNS失败.
    // 自行处理.
    RTLog(@"error: %@", [error localizedDescription]);
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
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
        
        //如果极简 SDK 不可用,会跳转支付宝钱包进行支付,需要将支付宝钱包的支付结果回传给 SDK
        if ([url.host isEqualToString:@"safepay"]) {
            
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                RTLog(@"支付result = %@",resultDic);
                SendNotify(AliPayResultNotification, resultDic)
            }];
            return YES;
        }
        if([url.host isEqualToString:@"alipayclient"]){//支付宝钱包快登授权返回 authCode
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                RTLog(@"支付result = %@",resultDic);
                SendNotify(AliPayResultNotification, resultDic)
            }];
            return YES;
        }
        NSString *string  = [url absoluteString];
        if([string hasPrefix:@"wx"]){
            return [WXApi handleOpenURL:url delegate:self];
        }
    }
    return result;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
        
        //如果极简 SDK 不可用,会跳转支付宝钱包进行支付,需要将支付宝钱包的支付结果回传给 SDK
        if ([url.host isEqualToString:@"safepay"]) {
            
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                RTLog(@"支付result = %@",resultDic);
                SendNotify(AliPayResultNotification, resultDic)
            }];
            return YES;
        }
        if([url.host isEqualToString:@"alipayclient"]){//支付宝钱包快登授权返回 authCode
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                RTLog(@"支付result = %@",resultDic);
                SendNotify(AliPayResultNotification, resultDic)
            }];
            return YES;
        }
        NSString *string  = [url absoluteString];
        if([string hasPrefix:@"wx"]){
            return [WXApi handleOpenURL:url delegate:self];
        }
    }
    return result;
}

//#define __IPHONE_10_0    100000
//#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
        
        //如果极简 SDK 不可用,会跳转支付宝钱包进行支付,需要将支付宝钱包的支付结果回传给 SDK
        if ([url.host isEqualToString:@"safepay"]) {
            
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                RTLog(@"支付result = %@",resultDic);
                SendNotify(AliPayResultNotification, resultDic)
            }];
            return YES;
        }
        if([url.host isEqualToString:@"alipayclient"]){//支付宝钱包快登授权返回 authCode
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                RTLog(@"支付result = %@",resultDic);
                SendNotify(AliPayResultNotification, resultDic)
            }];
            return YES;
        }
        NSString *string  = [url absoluteString];
        if([string hasPrefix:@"wx"]){
            return [WXApi handleOpenURL:url delegate:self];
        }
    }
    return result;
}
#pragma mark - WXApiDelegate
/*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
 *
 * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
 * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
 * @param req 具体请求内容，是自动释放的
 */
-(void)onReq:(BaseReq*)req{
    RTLog(@"%@",req);
}

/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 * @param resp 返回结果
 */
-(void)onResp:(BaseResp*)resp{
    NSLog(@"%d",resp.errCode);
    // SendMessageToQQResp应答帮助类
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp*response=(PayResp*)resp;
        switch(response.errCode){
            case WXSuccess:{
                //服务器端查询支付通知或查询API返回的结果再提示成功
                RTLog(@"支付成功");
            }
                break;
            default:{
                RTLog(@"支付失败，retcode=%d",resp.errCode);
            }
                break;
        }
        SendNotify(WeChatPayResultNotification,@(resp.errCode))
    }
}
@end
