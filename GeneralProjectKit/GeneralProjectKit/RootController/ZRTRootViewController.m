//
//  ZRTRootViewController.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "ZRTRootViewController.h"

@interface ZRTRootViewController ()<UMSocialUIDelegate>

@end

@implementation ZRTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)showTipsWithTitle:(NSString *)title
{
    XWAlerLoginView *alert = [[XWAlerLoginView alloc] initWithTitle:title];
    [alert show];
}
#pragma mark - API
- (void)shareUrl:(NSString *)url andTitle:(NSString *)title
{
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;
    
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;
    
    [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeDefault;
    [UMSocialData defaultData].extConfig.qqData.url = url;
    [UMSocialData defaultData].extConfig.qqData.title = title;
    
    [UMSocialData defaultData].extConfig.qzoneData.url = url;
    [UMSocialData defaultData].extConfig.qzoneData.title = title;
    
    [UMSocialData defaultData].extConfig.alipaySessionData.url = url;
    [UMSocialData defaultData].extConfig.alipaySessionData.title = title;
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:UmengAppKey shareText:title shareImage:[UIImage imageNamed:@"icon"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline, nil] delegate:self];
}

- (void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        NSLog(@"分享的平台: %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

- (void)goLogin
{
    ZRTRootViewController *login = [[ZRTRootViewController alloc]init];
    [[AppDelegate rootNavigationController] pushViewController:login animated:YES];
    
}
@end
