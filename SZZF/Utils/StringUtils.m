//
//  StringUtils.m
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "StringUtils.h"

@implementation StringUtils

/**
    获取当前时间戳
 */
+ (NSString *)getCurrentTimeStamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    return timeString;
}

/**
 获取当前时间
 */
+(NSString*)getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
}

+(NSString *)timestampToTime:(NSString *)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateStyle:NSDateFormatterMediumStyle];

    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];

    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp;
    if (timestamp.length >10) {
        confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]/1000];
    }else{
        confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    }
    

    NSLog(@"%@ = %@", timestamp, confromTimesp);

    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];

    return confromTimespStr;
}



/**
 分割字符串

 @param str 参数
 @return 返回值
 */
+ (NSArray *)componentSeparatedByString:(NSString *)str{
    NSArray *arr = [str componentsSeparatedByString:@","];
    return arr;
}

@end
