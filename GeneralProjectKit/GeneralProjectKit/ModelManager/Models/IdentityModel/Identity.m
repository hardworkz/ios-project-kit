//
//  Identity.m
//  RealmDemo
//
//  Created by haigui on 16/7/2.
//  Copyright © 2016年 com.luohaifang. All rights reserved.
//

#import "Identity.h"

@implementation Identity

MJExtensionCodingImplementation

- (instancetype)init
{
    self = [super init];
    if (self) {
        //是否为第一次使用软件
        _firstUseSoft = YES;
        //初始化获取软件版本号
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        _lastSoftVersion = currentVersion;
        
        //获取当前登录状态
        UserManager *usermanager = [UserManager manager];
        if (usermanager.user.userNo != 0) {
            _isLogin = NO;
        }
        _realmDataVersion = 0;
    }
    return self;
}

@end
