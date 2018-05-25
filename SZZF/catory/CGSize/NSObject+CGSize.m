//
//  NSObject+CGSize.m
//  SZZF
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "NSObject+CGSize.h"

@implementation NSObject (CGSize)
-(CGSize)getSizeWithString:(NSString *)string labelWidth:(CGFloat)width textFont:(NSInteger)font{
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
}
@end
