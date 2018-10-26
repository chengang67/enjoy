//
//  User.m
//  SZZF
//
//  Created by Apple on 2018/1/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "User.h"
static User *shared = nil;
@implementation User

+(instancetype) currentUser{
    if (shared == nil) {
        shared = [[super allocWithZone:NULL]init];
    }
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    shared.u_id = [df objectForKey:@"u_id"];
    shared.token = [df objectForKey:@"token"];
    shared.u_name = [df objectForKey:@"u_name"];
    return shared;
}

+(void)saveMemberId:(NSString *)memberId{
    NSUserDefaults *df=[NSUserDefaults standardUserDefaults];
    [df setObject:memberId forKey:@"u_id"];
    [df synchronize];
}

+(void)saveToken:(NSString *)token{
    NSUserDefaults *df=[NSUserDefaults standardUserDefaults];
    [df setObject:token forKey:@"token"];
    [df synchronize];
}

+(void)saveU_name:(NSString *)u_name{
    NSUserDefaults *df=[NSUserDefaults standardUserDefaults];
    [df setObject:u_name forKey:@"u_name"];
    [df synchronize];
}
@end
