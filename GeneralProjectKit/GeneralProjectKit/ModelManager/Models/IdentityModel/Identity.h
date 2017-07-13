//
//  Identity.h
//  RealmDemo
//
//  Created by haigui on 16/7/2.
//  Copyright © 2016年 com.luohaifang. All rights reserved.
//

//用来判断是否登录的 不存在数据库 归档处理
@interface Identity : NSObject

@property (nonatomic, assign) int userNo;//当前登录的用户编号
@property (nonatomic, assign) BOOL isLogin;//是否为登录状态
@property (nonatomic, assign) BOOL firstUseSoft;//是不是第一次使用软件
@property (nonatomic, assign) float realmDataVersion;//管理realm数据库版本，每当更新一个版本则+0.1
@property (nonatomic, strong) NSString *lastSoftVersion;//最近一次软件的版本号

@end
