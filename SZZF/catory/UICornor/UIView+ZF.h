//
//  UIView+ZF.h
//  YSStore
//
//  Created by ericwang on 16/8/3.
//  Copyright © 2016年 THS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZF)
@property (nonatomic,assign) CGFloat X;
@property (nonatomic,assign) CGFloat Y;
@property (nonatomic,assign) CGFloat CenterX;
@property (nonatomic,assign) CGFloat CenterY;
@property (nonatomic,assign) CGFloat W;
@property (nonatomic,assign) CGFloat H;
@property (nonatomic,assign) CGSize Size;
@property (nonatomic,assign) CGPoint Origin;
/**
 *  可视化设置边框宽度
 */
@property (nonatomic,assign)IBInspectable CGFloat borderWidth;
/**
 *  可视化设置边框颜色
 */
@property (nonatomic,strong)IBInspectable UIColor *borderColor;
/**
 *  可视化设置圆角
 */
@property (nonatomic,assign)IBInspectable CGFloat cornerRadius;

@end
