/**
 Copyright (c) 2016-present, yxiang.
 All rights reserved.
 Description: UITextField的一些便捷操作
 https://github.com/yxiangBeauty/Project.git
 */

#import <UIKit/UIKit.h>

@interface UITextField (YXAdd)

#pragma mark - 输入框范围限制

/**
 从左边的第几个位置开始输入
 */
- (void)spaceToLeft:(CGFloat)space;

/**
 右边的结束位置
 */
- (void)spaceToRight:(CGFloat)space;

@end
