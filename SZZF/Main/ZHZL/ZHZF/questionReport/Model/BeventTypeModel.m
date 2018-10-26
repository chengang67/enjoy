//
//  BeventTypeModel.m
//  SZZF
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BeventTypeModel.h"

@implementation BeventTypeModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"data" : @"SuperStyleModel",
             };
}
+(void)getEventStyleWithEt_type:(NSString*)et_type et_level:(NSString *)et_level et_parentid:(NSString *)et_parentid successed:(ModelBlock)success failed:(FailBlock)fail{
    
    [HTTPTool getCacheRequestWithUrlString:@"find/getEventType" parameters:@{@"et_type":et_type,@"et_level":et_level,@"et_parentid":et_parentid} cacheTime:0 succeed:^(id data) {
        BeventTypeModel *model = [BeventTypeModel mj_objectWithKeyValues:data];
        success(model.data);
    } fail:^(NSString *error) {
        fail(error);
    }];
}



@end
