//
//  Sign.m
//  Sign
//
//  Created by gooduncle on 2017/9/28.
//  Copyright © 2017年 陈钢. All rights reserved.
//

#import "Sign.h"

@implementation Sign
+(NSString *)
createSignWithTimeStamp:(NSString *)timestamp Token:(NSString *)token{
    if (timestamp ==NULL || token ==NULL) {
        return @"";
    }
    NSString * sign=@"";
    long ts = 0;
    NSString *tk =@"";
    NSString *date = [self timestampToDateFormartWithStamp:timestamp];
    NSArray *array = [date componentsSeparatedByString:@"-"];
    NSString *y = array[0];
    NSString *m = array[1];
    NSString *d = array[2];
    int iCkeck = [y intValue] - [m intValue] - [d intValue] ;
    int iCkeck2 = [y intValue] + [m intValue] + [d intValue] ;
    ts = [timestamp intValue]/iCkeck +iCkeck2 +([timestamp intValue]- 8888);
    int index = abs([m intValue] - [d intValue] );
    tk = [token substringFromIndex:index];
    sign = [NSString stringWithFormat:@"%@%ld",tk, ts];
    if (sign.length > 32) {
        sign = [sign substringToIndex:32];
    }else if (sign.length<32){
        sign = [NSString stringWithFormat:@"%@%@",sign, [token substringToIndex:32- sign.length]];
    }

    return sign;
}

+(NSString *)timestampToDateFormartWithStamp:(NSString*)timestamp{
    NSString *str=timestamp;//时间戳
    NSTimeInterval time=[str doubleValue];//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    currentDateStr = [currentDateStr substringToIndex:10];
    return currentDateStr;
}
@end
