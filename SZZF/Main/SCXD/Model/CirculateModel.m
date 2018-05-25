//
//  CirculateModel.m
//  SZZF
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "CirculateModel.h"

@implementation CirculateModel

+ (NSDictionary *)objectClassInArray{
    return @{
             @"data" : @"CirculateListModel",
             };
}


+(void)getCirculatesuccessed:(ModelBlock)success failed:(FailBlock)fail{
    NSString *u_id = [User currentUser].u_id;
    [HTTPTool getCacheRequestWithUrlString:@"getCirculateDepartMentAll" parameters:@{@"u_id":u_id} cacheTime:0 succeed:^(id data) {
        CirculateModel * model = [CirculateModel mj_objectWithKeyValues:data];
        success(model);
    } fail:^(NSString *error) {
        fail(error);
    }];
}
@end


@implementation CirculateListModel

+ (NSDictionary *)objectClassInArray{
    return @{
             @"users" : @"BUser",
             };
}

@end



