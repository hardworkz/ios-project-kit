//
//  ZRTRootViewController.h
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRTRootViewController : UIViewController
/**
 提示弹窗

 @param title 文字内容
 */
- (void)showTipsWithTitle:(NSString *)title;
/**
 *  分享页面
 *
 *  @param url   url
 *  @param title 标题
 */
- (void)shareUrl:(NSString *)url andTitle:(NSString *)title;

/**
 弹出登录页面
 */
- (void)goLogin;
@end
