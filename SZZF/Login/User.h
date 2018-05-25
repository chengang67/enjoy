//
//  User.h
//  SZZF
//
//  Created by Apple on 2018/1/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic,strong)NSString *u_name;
@property(nonatomic,strong)NSString *u_pass;
@property(nonatomic,strong)NSString *u_id;
@property(nonatomic,strong)NSString *token;
+(instancetype) currentUser;
+(void)saveMemberId:(NSString *)memberId;
+(void)saveToken:(NSString *)token;
+(void)saveU_name:(NSString *)u_name;
@end
