//
//  ZRTRootLoginViewController.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/11.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "ZRTRootLoginViewController.h"

@interface ZRTRootLoginViewController ()

@end

@implementation ZRTRootLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        
        if (!error) {
            UMSocialUserInfoResponse *resp = result;
            // 第三方登录数据(为空表示平台未提供)
            // 授权数据
            NSLog(@" uid: %@", resp.uid);
            NSLog(@" openid: %@", resp.openid);
            NSLog(@" accessToken: %@", resp.accessToken);
            NSLog(@" refreshToken: %@", resp.refreshToken);
            NSLog(@" expiration: %@", resp.expiration);
            
            // 用户数据
            NSLog(@" name: %@", resp.name);
            NSLog(@" iconurl: %@", resp.iconurl);
            NSLog(@" gender: %@", resp.unionGender);
            
            // 第三方平台SDK原始数据
            NSLog(@" originalResponse: %@", resp.originalResponse);
        }else{
            [self showTipsWithTitle:error.description];
        }
    }];
}
- (void)weiBoLogin
{
    [self getUserInfoForPlatform:UMSocialPlatformType_Sina];
}
- (void)weChatLogin
{
    [self getUserInfoForPlatform:UMSocialPlatformType_WechatSession];
}
- (void)QQLogin
{
    [self getUserInfoForPlatform:UMSocialPlatformType_QQ];
}
@end
