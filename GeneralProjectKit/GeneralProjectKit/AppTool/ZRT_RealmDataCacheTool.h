//
//  ZRT_RealmDataCacheTool.h
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/14.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRT_RealmDataCacheTool : NSObject

/**
 单例

 @return 返回单例
 */
+ (instancetype)manager;

/**
 保存列表数据

 @param array 模型数组
 @param realmName 保存数据库名称
 @param className 模型类名
 */
- (void)saveDataWithModelArray:(NSArray *)array realmName:(NSString *)realmName class:(NSString *)className;

/**
 读取数据库数据

 @param realmName 保存数据库名称
 @param className 模型类名
 @param complete 读取成功回调
 */
- (void)readDataWithRealmName:(NSString *)realmName class:(NSString *)className complete:(void (^)(NSMutableArray *responseObject))complete;

/**
 创建数据库观察者

 @param realmName 保存数据库名称
 @param className 模型类名
 @return 返回观察者，需要在控制器设置代理，实现代理方法:controllerDidChangeContent
 */
- (RBQFetchedResultsController*)createUserFetchedResultsControllerWithRealmName:(NSString *)realmName className:(NSString *)className;
@end
