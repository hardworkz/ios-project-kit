//
//  ZRTRootNavigationController.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "ZRTRootNavigationController.h"

@interface ZRTRootNavigationController ()

@end

@implementation ZRTRootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 重写push方法，判断是否为第一级页面，隐藏显示tabbarView
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        viewController.view.userInteractionEnabled = YES;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
