//
//  Sign.h
//  Sign
//
//  Created by gooduncle on 2017/9/28.
//  Copyright © 2017年 陈钢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sign : NSObject
+(NSString *)createSignWithTimeStamp:(NSString *)timestamp Token:(NSString *)token;
+(NSString *)timestampToDateFormartWithStamp:(NSString*)timestamp;
@end
