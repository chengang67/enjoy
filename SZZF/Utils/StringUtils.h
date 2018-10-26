//
//  StringUtils.h
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject
+ (NSString *)getCurrentTimeStamp;
+(NSString*)getCurrentTimes;
+ (NSArray *)componentSeparatedByString:(NSString *)str;
+(NSString *)timestampToTime:(NSString *)timestamp andFormatter:(NSString *)format;
@end
