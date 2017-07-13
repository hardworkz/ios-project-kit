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

/**
 修改数据模型后调用，数据库版本迭代增加

 @param schemaVersion 数据库版本
 */
- (void)realmDataStructureChangesWithVersion:(uint64_t)schemaVersion;
@end
