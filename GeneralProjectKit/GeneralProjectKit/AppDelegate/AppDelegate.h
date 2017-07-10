//
//  AppDelegate.h
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong,nonatomic)UIViewController * viewController;

/**
 应用主导航栏控制器
 */
+ (UINavigationController *)rootNavigationController;

/**
 应用代理
 */
+ (AppDelegate *)delegate;
@end

