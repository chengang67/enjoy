//
//  HistoryCountModel.m
//  SZZF
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HistoryCountModel.h"

@implementation HistoryCountModel
+(void)getHistoryEventCountWithU_id:(NSString *)u_id successed:(ModelBlock)success failed:(FailBlock)fail{
    [HTTPTool getCacheRequestWithUrlString:@"LsajCount" parameters:@{@"u_id":u_id} cacheTime:0 succeed:^(id data) {
        HistoryCountModel *historyCount = [HistoryCountModel mj_objectWithKeyValues:data[@"data"]];
        NSLog(@"historyCount==%@",historyCount);
        success(historyCount);
    } fail:^(NSString *error) {
        
    }];
}
@end
