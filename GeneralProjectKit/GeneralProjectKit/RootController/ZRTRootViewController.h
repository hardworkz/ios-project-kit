//
//  ZRTRootViewController.h
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/10.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 在控制器新定义一个模型类
 */
@interface Model : NSObject
/**
 *  可变的数组
 */
@property (strong,nonatomic)NSMutableArray *modelArray;

@end

@interface ZRTRootViewController : UIViewController
/**
 设置导航栏返回按钮的图片

 @param imageName 返回图片
 */
- (void)setBackBarItemWithImage:(NSString *)imageName action:(SEL)action;
/**
 pop
 */
- (void)back;
/**
 dismiss

 @param complete 完成block
 */
- (void)dismissComplete:(void(^)())complete;
/**
 提示弹窗

 @param title 文字内容
 */
- (void)showTipsWithTitle:(NSString *)title;

/**
 分享页面

 @param url webpage
 @param title 标题
 @param descr 描述
 @param imageUrl 拇指图路径
 */
- (void)shareUrl:(NSString *)url andTitle:(NSString *)title andDescr:(NSString *)descr andThumbImage:(NSString *)imageUrl;

/**
 弹出登录页面
 */
- (void)goLogin;

/**
 显示无数据状态
 
 @param clickNoDataIcon 点击回调block
 */
- (void)showTableViewWithNoDataWithClick:(void (^)())clickNoDataIcon;
/**
 去除无数据状态
 */
- (void)removeTableViewNoData;

/**
 添加模型数据方法

 @param object 对象模型
 */
- (NSMutableArray *)addObject:(id)object;
/**
 添加数组数据方法

 @param array 数组
 */
- (NSMutableArray *)addObjectFromArray:(NSArray *)array;

/**
 rootTableView
 */
- (UITableView *)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;
@end
