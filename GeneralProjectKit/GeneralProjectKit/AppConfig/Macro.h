/**
 Copyright (c) 2016-present, yxiang.
 All rights reserved.
 Description: 所有的宏定义
 https://github.com/yxiangBeauty/Project.git
 */

#ifndef Macro_h
#define Macro_h

#import <UIKit/UIDevice.h>

#define kScWd [UIScreen mainScreen].bounds.size.width   // < 屏幕宽度
#define kScWh [UIScreen mainScreen].bounds.size.height  // < 屏幕高度
#define kNtfcCt [NSNotificationCenter defaultCenter]    // < 通知中心
#define kUdFt [NSUserDefaults standardUserDefaults]     // < 偏好设置

#define kRadomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]       // < 随机色
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]                                                         // < RGBA颜色

#define kPathTemp NSTemporaryDirectory() // < 获取temp
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]                         // < 获取沙盒 Document
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]                         // < 获取沙盒 Cache

#define YXLocalString(string) NSLocalizedString(string, nil) // < 国际化

#define YXFontSize(s) [UIFont systemFontOfSize:(s)]                 // < 普通字体
#define YXBoldFontSize(s) [UIFont boldSystemFontOfSize:(s)]         // < 加粗字体
#define YXItalicFontSize(s) [UIFont italicSystemFontOfSize:(s)]     // < Italic字体

#define kDeviceOSVersion [[[UIDevice currentDevice] systemVersion] floatValue] // < 系统版本号
#define kKeyWindow [UIApplication sharedApplication].keyWindow                 // < key window

#define YXLoadImage(f, e) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:f ofType:e]]                                   // < 从路径加载图片
#define YXImage(r) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:r ofType:nil]]                                           // < 从Bundle中加载图片
#define YXImageNamed(n) [UIImage imageNamed:n]   // < 根据名字加载图片

// < 弱引用
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

// < 强引用
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

// < 调试时Log，发布的时不Log
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

// < 设置View圆角和边框
#define YXViewBorderPropertyies(View, Radius, Width, Color)\
[View.layer setCornerRadius:(Radius)]];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#endif /* Macro_h */
