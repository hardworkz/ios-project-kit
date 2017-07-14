//
//  User.h
//  RealmDemo
//
//  Created by haigui on 16/7/2.
//  Copyright © 2016年 com.luohaifang. All rights reserved.
//


//当前用户
@interface User : RLMObject
@property (nonatomic, assign) int userNo;//用户编号
@property (nonatomic, strong) NSString *name;//用户名字
@property (nonatomic, strong) NSString *ignoreTestProperty;//测试realm忽略属性方法
@property (nonatomic, strong) NSString *defaultPropertyValueTest;//测试realm属性默认值设置方法
@property (nonatomic, strong) NSString *indexPropertyTest;//测试realm属性索引方法
@end
RLM_ARRAY_TYPE(User)// 定义RLMArray类型，即该模型中有数组模型数据类型，该数组中只能存放为RLMObject模型
