//
//  AppDelegate+ZRTAppService.h
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (ZRTAppService)
/**
 *  友盟分享注册
 */
- (void)registerUmeng;
/**
 *  Mob注册
 */
- (void)registerMob;
/**
 *  友盟统计
 */
- (void)registerUmengConfigure;
/**
 *  防止应用中的数组，字典，等空值引起的crash
 */
- (void)avoidCrash;
@end
