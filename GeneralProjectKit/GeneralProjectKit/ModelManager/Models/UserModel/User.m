//
//  User.m
//  RealmDemo
//
//  Created by haigui on 16/7/2.
//  Copyright © 2016年 com.luohaifang. All rights reserved.
//

#import "User.h"

@implementation User
//MJ框架的模型incode和decode解决方法
MJExtensionCodingImplementation
//设置表中主键属性
+ (NSString*)primaryKey {
    return @"userNo";
}
//忽略表中属性
+ (NSArray<NSString *> *)ignoredProperties
{
    return @[@"ignoreTestProperty"];
}
//设置表中属性默认值
+ (NSDictionary *)defaultPropertyValues
{
    return @{@"defaultPropertyValueTest":@"哈哈！这是测试默认值数据"};
}
//设置表中属性索引
+ (NSArray<NSString *> *)indexedProperties
{
    return @[@"indexPropertyTest"];
}
@end
