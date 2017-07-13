//
//  ZRT_AvoidCrashTool.m
//  GeneralProjectKit
//
//  Created by 泡果 on 2017/7/12.
//  Copyright © 2017年 ZRT. All rights reserved.
//

#import "ZRT_AvoidCrashTool.h"

@implementation ZRT_AvoidCrashTool
///主要调用该方法,对服务器返回的数据，数组，字典，字符串，NSNumber类型做容错处理，替换掉（null）,nil,<null>,null等进行替换，替换为空字符串@""
+ (id)replaceNullData:(id)obj {
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return [self replaceNullWithDictionary:obj];
    }
    else if ([obj isKindOfClass:[NSArray class]]) {
        return [self replaceNullWithArray:obj];
    }
    else if ([obj isKindOfClass:[NSNumber class]]) {
        if ([obj isKindOfClass:[NSNull class]] || obj == nil) {
            obj = @(0);
        }
        return obj;
    }
    else if ([obj isKindOfClass:[NSString class]]) {
        return [self replaceNullValue:obj];
    }
    return obj;
}

///处理字典
+ (id)replaceNullWithDictionary:(NSMutableDictionary *)dic {
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    NSArray *allKey = [dic allKeys];
    for (NSString *key in allKey) {
        [tempDic setObject:[self replaceNullData:dic[key]] forKey:key];
    }
    return tempDic;
}

///处理数组
+ (id)replaceNullWithArray:(NSMutableArray *)arr {
    __block NSMutableArray *tempArr = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tempArr addObject:[self replaceNullData:obj]];
    }];
    return tempArr;
}

///处理字符串
+ (NSString *)replaceNullValue: (NSString *)string {
    NSString * newStr = [NSString stringWithFormat:@"%@",string];
    if ([newStr isKindOfClass:[NSNull class]] ||
        newStr == nil ||
        [newStr isEqualToString:@"(null)"]||
        [newStr isEqualToString:@"null"] ||
        [newStr isEqualToString:@"<null>"] ||
        [newStr isEqual:[NSNull null]]) {
        newStr = @"";
    }
    return newStr;
}

//链接：http://www.jianshu.com/p/bfdabdd05080
//來源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
@end
