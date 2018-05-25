//
//  LoginModel.h
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : BaseModel
+(void)getHomeListWith:( NSString * )u_name u_password:( NSString * )u_password successed:(ModelBlock)success failed:(FailBlock)fail;
@end
