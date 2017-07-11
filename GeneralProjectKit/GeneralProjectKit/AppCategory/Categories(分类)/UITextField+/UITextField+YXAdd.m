/**
 Copyright (c) 2016-present, yxiang.
 All rights reserved.
 Description: UITextField的一些便捷操作
 https://github.com/yxiangBeauty/Project.git
 */


#import "UITextField+YXAdd.h"

@implementation UITextField (YXAdd)

#pragma mark - 输入框范围限制

- (void)spaceToLeft:(CGFloat)space
{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, space, 1)];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftView;
}

- (void)spaceToRight:(CGFloat)space
{
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, space, 1)];
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = rightView;
}

@end
