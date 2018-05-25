//
//  BUser.h
//  SZZF
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BUser : NSObject
@property(nonatomic, assign)NSInteger id;

@property(nonatomic, assign)NSInteger u_id;

@property(nonatomic, copy)NSString * u_name;

@property(nonatomic, copy)NSString * u_realname;

@property(nonatomic, copy)NSString * u_pass;

@property(nonatomic, copy)NSString * u_password;

@property(nonatomic, assign)NSInteger u_departmentid;

@property(nonatomic, copy)NSString * u_job;

@property(nonatomic, copy)NSString * u_workingtime;

@property(nonatomic, copy)NSString * u_sex;

@property(nonatomic, copy)NSString * u_tel;

@property(nonatomic, copy)NSString * u_phone;

@property(nonatomic, assign)NSInteger u_status;

@property(nonatomic, assign)NSInteger u_sort;

@property(nonatomic, copy)NSString * u_address;

@property(nonatomic, copy)NSString * u_remark;

@property(nonatomic, assign)NSInteger u_roleid;
@end
