//
//  EventCheckModel.m
//  SZZF
//
//  Created by Apple on 2018/3/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "EventCheckModel.h"

@implementation EventCheckModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"data" : @"BeventModel2",
             };
}

+(void)getEventListWithU_id:(NSString *)u_id limit:(NSInteger)limit offset:(NSInteger)offset block:(NSString *)block successed:(ModelBlock)success failed:(FailBlock)fail{
    [HTTPTool getCacheRequestWithUrlString:@"flowList" parameters:@{@"limit":@(limit),@"offset":@(offset),@"u_id":u_id,@"block":block} cacheTime:0 succeed:^(id data) {
        NSLog(@"%@",data);
        EventCheckModel *model = [EventCheckModel mj_objectWithKeyValues:data];
        success(model.data);
    } fail:^(NSString *error) {
        fail(error);
    }];
}

+(void)getHistoryEventListWithU_id:(NSString *)u_id limit:(NSInteger)limit offset:(NSInteger)offset type:(NSInteger)type successed:(ModelBlock)success failed:(FailBlock)fail{
    [HTTPTool getCacheRequestWithUrlString:@"lsajList" parameters:@{@"limit":@(limit),@"offset":@(offset),@"u_id":u_id,@"type":@(type)} cacheTime:0 succeed:^(id data) {
        EventCheckModel *model = [EventCheckModel mj_objectWithKeyValues:data];
        success(model.data);
    } fail:^(NSString *error) {
        fail(error);
    }];
}


@end
