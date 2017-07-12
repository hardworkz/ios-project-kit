//
//  AppDelegate+ZRTAppRootController.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "AppDelegate+ZRTAppRootController.h"
#import "ZRT_MainViewController.h"

@implementation AppDelegate (ZRTAppRootController)
- (void)setAppWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UITabBarController alloc] init];
    [self.window makeKeyAndVisible];
}
- (void)setRootViewController
{
    //获取当前应用版本和上一个应用版本进行比较，如果不相同则为进行过更新
    IdentityManager *identityManager = [IdentityManager manager];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    if ([identityManager.identity.lastSoftVersion isEqualToString:currentVersion])
    {
        //不是第一次安装
        [self setRoot];
    }
    else
    {
        //新特性界面展示
        UIViewController *emptyView = [[ZRTRootViewController alloc ] init];
        self.window.rootViewController = emptyView;
        [self createLoadingScrollView];
        
        //保存当前版本号
        identityManager.identity.lastSoftVersion = currentVersion;
    }
}
- (void)setTabbarController
{
    
}
- (void)setLoginController
{
    
}
- (void)setRoot
{
    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:[ZRT_MainViewController new]];
    navc.navigationBar.barTintColor = Main_Color;
    
    navc.navigationBar.shadowImage = [[UIImage alloc] init];
    [navc.navigationBar setTranslucent:NO];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navc.navigationBar.tintColor = [UIColor whiteColor];
    self.window.rootViewController = navc;
}
#pragma mark - 引导页
/**
 *  首次启动轮播图
 */
- (void)createLoadingScrollView
{//引导页
    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:self.window.bounds];
    sc.pagingEnabled = YES;
    sc.delegate = self;
    sc.showsHorizontalScrollIndicator = NO;
    sc.showsVerticalScrollIndicator = NO;
    [self.window.rootViewController.view addSubview:sc];
    
    NSArray *arr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    for (NSInteger i = 0; i<arr.count; i++)
    {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW*i, 0, kScreenW, self.window.frame.size.height)];
        img.image = [UIImage imageNamed:arr[i]];
        [sc addSubview:img];
        img.userInteractionEnabled = YES;
        if (i == arr.count - 1)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake((self.window.frame.size.width/2)-50, kScreenH-110, 100, 40);
            btn.backgroundColor = Main_Color;
            [btn setTitle:@"开始体验" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goToMain) forControlEvents:UIControlEventTouchUpInside];
            [img addSubview:btn];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = Main_Color.CGColor;
        }
    }
    sc.contentSize = CGSizeMake(kScreenW*arr.count, self.window.frame.size.height);
}
- (void)goToMain
{
    [self setRoot];
}

@end
