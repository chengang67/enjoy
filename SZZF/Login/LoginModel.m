//
//  LoginModel.m
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+(void)getHomeListWith:(NSString*)u_name u_password:(NSString *)u_password successed:(ModelBlock)success failed:(FailBlock)fail{
    [HTTPTool getCacheRequestWithUrlString:@"login" parameters:@{@"u_name":u_name,@"u_password":u_password} cacheTime:0 succeed:^(id data) {
        NSDictionary * dic =data[@"data"];
        NSString *token = [NSString stringWithFormat:@"%@",[dic objectForKey:@"token"]];
        User *user = [User mj_objectWithKeyValues:dic[@"user"]];
        [User saveMemberId:user.u_id];
        [User saveU_name:user.u_name];
        [User saveToken:token];
        success(user);
    } fail:^(NSString *error) {
        fail(error);
    }];
}


@end
