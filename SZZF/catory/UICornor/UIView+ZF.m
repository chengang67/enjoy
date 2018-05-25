//
//  UIView+ZF.m
//  YSStore
//
//  Created by ericwang on 16/8/3.
//  Copyright © 2016年 THS. All rights reserved.
//

#import "UIView+ZF.h"

@implementation UIView (ZF)
- (void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}

- (void)setY:(CGFloat)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}

- (CGFloat)X
{
    return self.frame.origin.x;
}

- (CGFloat)Y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)CenterX
{
    CGPoint center = self.center;
    center.x = CenterX;
    self.center = center;
}

- (CGFloat)CenterX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)CenterY
{
    CGPoint center = self.center;
    center.y = CenterY;
    self.center = center;
}

- (CGFloat)CenterY
{
    return self.center.y;
}

- (void)setW:(CGFloat)W
{
    CGRect frame = self.frame;
    frame.size.width = W;
    self.frame = frame;
}

- (void)setH:(CGFloat)H
{
    CGRect frame = self.frame;
    frame.size.height = H;
    self.frame = frame;
}

- (CGFloat)H
{
    return self.frame.size.height;
}

- (CGFloat)W
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)Size
{
    CGRect frame = self.frame;
    frame.size = Size;
    self.frame = frame;
}

- (CGSize)Size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)Origin
{
    CGRect frame = self.frame;
    frame.origin = Origin;
    self.frame = frame;
}

- (CGPoint)Origin
{
    return self.frame.origin;
}
- (CGFloat)borderWidth{
    return self.borderWidth;
}
- (UIColor *)borderColor{
    return self.borderColor;
}
- (CGFloat)cornerRadius{
    return self.cornerRadius;
}
/**
 *  设置边框宽度
 */
- (void)setBorderWidth:(CGFloat)borderWidth
{
    if(borderWidth <0)return;
    self.layer.borderWidth = borderWidth;
}
/**
 *  设置边框颜色
 */
- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}
/**
 *  设置圆角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius >0;
}
@end
