//
//  AppDelegate+ZRTAppRootController.h
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (ZRTAppRootController)<UIScrollViewDelegate>
/**
 *  tabbar实例
 */
- (void)setTabbarController;
/**
 *  login实例
 */
- (void)setLoginController;
/**
 *  window实例
 */
- (void)setAppWindows;
/**
 *  根视图
 */
- (void)setRootViewController;

@end
