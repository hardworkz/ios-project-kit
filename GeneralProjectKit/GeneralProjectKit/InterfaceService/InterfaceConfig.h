//
//  InterfaceConfig.h
//  DashunClient
//
//  Created by lottak_mac2 on 16/9/27.
//  Copyright © 2016年 com.lottak. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const KBSSDKAPIURL;

@interface InterfaceConfig : NSObject
/**
 登录接口
 */
@property (strong, nonatomic) NSString *LoginAPI;

extern NSString *const KBSSDKAPIURLs;
@end
