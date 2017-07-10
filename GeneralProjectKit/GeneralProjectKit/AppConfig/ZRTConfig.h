//
//  ZRTConfig.h
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#ifndef ZRTConfig_h
#define ZRTConfig_h
//屏幕宽高
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
/**
 *  RGB值
 *
 *  @param R 值0-255
 *  @param G 值0-255
 *  @param B 值0-255
 *  @param A 值0-1
 *
 *  @return UIColor对象
 */
#define ColorWithRGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
/**
 *  随机颜色
 */
#define RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1]
//HEXCOLOR(0x00ffff)
#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

#define Main_Color [UIColor colorWithRed:(3)/255.0 green:(160)/255.0 blue:(235)/255.0 alpha:1.0]

// debug打印,发布不打印
#ifdef DEBUG
#define RTLog(...) NSLog(__VA_ARGS__)
#else
#define RTLog(...)
#endif
// 消息通知
#define RegisterNotify(_name, _selector)                    \
[[NSNotificationCenter defaultCenter] addObserver:self  \
selector:_selector name:_name object:nil];

#define RemoveNofify            \
[[NSNotificationCenter defaultCenter] removeObserver:self];

#define SendNotify(_name, _object)  \
[[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object];
//应用图标和应用名称
#define APPICONIMAGE [UIImage imageNamed:[[[[NSBundle mainBundle] infoDictionary] valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject]]
#define APPNAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
//当前版本号
#define APPVERSION ([[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"])
//当前bunleidentifier
#define APPBUNDLEIDENTIFIER ([[NSBundle mainBundle] bundleIdentifier])
//判断是否是IPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//通知和用户单例
#define ZRT_NotificationCenter [NSNotificationCenter defaultCenter]
#define ZRT_UserDefault [NSUserDefaults standardUserDefaults]
/**
 图片placeholder
 */
#define Default_Person_Image [UIImage imageNamed:@"default_parents"]
#define Default_General_Image [UIImage imageNamed:@"default_general"]
//第三方服务的key
#define UmengAppKey @"550a9500fd98c55ab1000f57"//友盟分享appKey
#define ShareQQAppID @"1104418201"//腾讯appID
#define ShareQQAppKey @"ypxK0NC3YD3ZbagT"//腾讯appKey
#define WetChatAppId @"wx7b1afe37e90787fc"//微信appID
#define WetChatAppSecret @"2bd06ca54d0aca139be9f6e89c04355f"//微信appSecret
#define SMSMobAppKey @"683feb4e2540"//MobAppKey
#define SMSMobAppSecret @"8ad765a4dae8d2d2948ff72944b0d8a0"
#define SMSMobAppKeyTest @"114ed22f249fe"//MobAppKey--测试使用
#define SMSMobAppSecretTest @"59c4b7aa8864140c2512acfaeb81e063"
#define BuglyKey @"900021400"


#endif /* ZRTConfig_h */
